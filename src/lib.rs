use zed_extension_api as zed;

struct RazorExtension;

impl zed::Extension for RazorExtension {
    fn new() -> Self {
        Self
    }
}

zed::register_extension!(RazorExtension);