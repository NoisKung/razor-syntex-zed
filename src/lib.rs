use zed_extension_api as zed;

struct RazorExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for RazorExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        match language_server_id.as_ref() {
            "omnisharp" => {
                let path = worktree.which("omnisharp").or_else(|| {
                    worktree.which("OmniSharp")
                });

                if let Some(path) = path {
                    Ok(zed::Command {
                        command: path,
                        args: vec!["--languageserver".to_string(), "--hostPID".to_string(), std::process::id().to_string()],
                        env: Default::default(),
                    })
                } else {
                    Err("OmniSharp language server not found".to_string())
                }
            }
            language_server_id => Err(format!("Unknown language server: {language_server_id}")),
        }
    }

    fn label_for_completion(
        &self,
        _language_server_id: &zed::LanguageServerId,
        completion: zed::lsp::Completion,
    ) -> Option<zed::CodeLabel> {
        match completion.kind? {
            zed::lsp::CompletionKind::Method | zed::lsp::CompletionKind::Function => {
                let name = &completion.label;
                Some(zed::CodeLabel {
                    spans: vec![zed::CodeLabelSpan::code_range(0..name.len())],
                    filter_range: 0..name.len(),
                    code: name.clone(),
                })
            }
            _ => None,
        }
    }
}

zed::register_extension!(RazorExtension);