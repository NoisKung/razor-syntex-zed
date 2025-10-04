#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import prettier from 'prettier';

// Ensure plugin is resolvable
const plugin = await import('prettier-plugin-razor');

function parseArgs(argv) {
  const out = { filePath: undefined };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === '--file-path' || a === '-f') {
      out.filePath = argv[++i];
    }
  }
  return out;
}

async function main() {
  const { filePath } = parseArgs(process.argv.slice(2));
  const input = await new Promise((resolve, reject) => {
    let data = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => (data += chunk));
    process.stdin.on('end', () => resolve(data));
    process.stdin.on('error', reject);
  });

  const options = await prettier.resolveConfig(filePath ?? process.cwd()).catch(() => ({}));
  const text = await prettier.format(input, {
    ...options,
    filepath: filePath ?? 'input.razor',
    plugins: [plugin.default ?? plugin],
  });
  process.stdout.write(text);
}

main().catch((err) => {
  console.error(err?.stack || String(err));
  process.exit(1);
});
