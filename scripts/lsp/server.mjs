#!/usr/bin/env node
import process from 'node:process';
import prettier from 'prettier';
const plugin = await import('prettier-plugin-razor');

// Very small LSP subset: handle initialize, shutdown, textDocument/formatting
let nextId = 1;
const send = (msg) => {
  const json = JSON.stringify(msg);
  process.stdout.write(`Content-Length: ${Buffer.byteLength(json, 'utf8')}\r\n\r\n${json}`);
};

function readHeaders(chunk) {
  const s = chunk.toString('utf8');
  const idx = s.indexOf('\r\n\r\n');
  if (idx === -1) return null;
  const headerText = s.slice(0, idx);
  const rest = s.slice(idx + 4);
  const headers = {};
  for (const line of headerText.split('\r\n')) {
    const [k, v] = line.split(':');
    headers[k.trim().toLowerCase()] = v.trim();
  }
  return { headers, rest };
}

let buffer = '';
process.stdin.on('data', (chunk) => {
  buffer += chunk.toString('utf8');
  while (true) {
    const meta = readHeaders(buffer);
    if (!meta) break;
    const len = Number(meta.headers['content-length'] || 0);
    if (meta.rest.length < len) break;
    const body = meta.rest.slice(0, len);
    buffer = meta.rest.slice(len);
    const msg = JSON.parse(body);
    handle(msg).catch((e) => console.error(e));
  }
});

async function handle(msg) {
  if (msg.method === 'initialize') {
    send({ jsonrpc: '2.0', id: msg.id, result: { capabilities: { documentFormattingProvider: true } } });
    return;
  }
  if (msg.method === 'initialized') return;
  if (msg.method === 'shutdown') {
    send({ jsonrpc: '2.0', id: msg.id, result: null });
    return;
  }
  if (msg.method === 'exit') {
    process.exit(0);
  }
  if (msg.method === 'textDocument/formatting') {
    const uri = msg.params.textDocument.uri;
    const text = cache.get(uri) ?? '';
    const path = decodeURI(uri.replace('file://', ''));
    const options = await prettier.resolveConfig(path).catch(() => ({}));
    const formatted = await prettier.format(text, { ...options, filepath: path, plugins: [plugin.default ?? plugin] });
    send({ jsonrpc: '2.0', id: msg.id, result: [{ range: fullRange(text), newText: formatted }] });
    return;
  }
  if (msg.method === 'textDocument/didOpen') {
    cache.set(msg.params.textDocument.uri, msg.params.textDocument.text);
    return;
  }
  if (msg.method === 'textDocument/didChange') {
    const uri = msg.params.textDocument.uri;
    const changes = msg.params.contentChanges;
    if (changes && changes.length) cache.set(uri, changes[changes.length - 1].text);
    return;
  }
  if (msg.id) {
    send({ jsonrpc: '2.0', id: msg.id, result: null });
  }
}

const cache = new Map();
function fullRange(text) {
  const lines = text.split('\n');
  return {
    start: { line: 0, character: 0 },
    end: { line: Math.max(0, lines.length - 1), character: lines[lines.length - 1].length }
  };
}
