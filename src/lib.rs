use zed_extension_api as zed;

struct RazorExtension;

impl zed::Extension for RazorExtension {
    fn new() -> Self { Self }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        if language_server_id.as_ref() == "razor-formatter" {
            let node = zed::node_binary_path()?;
            // Ensure required NPM packages are installed in the extension workspace
            let _ = zed::npm_install_package("prettier", "^3.3.3");
            let _ = zed::npm_install_package("prettier-plugin-razor", "^0.9.0");
            Ok(zed::Command {
                command: node,
                args: vec![
                    "scripts/lsp/server.mjs".into(),
                ],
                env: Default::default(),
            })
        } else {
            Err("unknown language server".into())
        }
    }
}

zed::register_extension!(RazorExtension);
