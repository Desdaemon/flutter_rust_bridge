class FlutterRustBridgeCodegen < Formula
  desc "High-level memory-safe binding generator for Flutter/Dart <-> Rust"
  homepage "https://fzyzcjy.github.io/flutter_rust_bridge"
  url "https://github.com/Desdaemon/flutter_rust_bridge/archive/v1.37.13-dev.tar.gz"
  sha256 "2c504b5738d93c2e267d3269e50667e3f884ef57159356191b909f5ebcb267b2"
  license "MIT"

  bottle do
    root_url "https://github.com/Desdaemon/homebrew-repo/releases/download/flutter_rust_bridge_codegen-1.37.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "d1b616bc137f70ac82bbf6bde623876f73c09999795a6de6158bc8adfc5f2f18"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a9d8c5efeb94057cc21b46dc5f1c5fa40949b2ef74e2fc61eb7829021e1299e"
  end

  depends_on "rust" => :build
  depends_on "dart" => :test

  def install
    system "cargo", "install", "--root", prefix, "--path", buildpath/"frb_codegen"
  end

  test do
    system "cargo", "new", "--lib", "native"
    (testpath/"native/lib.rs").write "mod api;", mode: 'a'
    (testpath/"native/api.rs").write <<~API
      pub fn test() {
        println!("Hello from Rust!")
      }
    API
    system bin/"dart", "pub", "global", "activate", "ffigen"
    system "rustup", "default", "stable"
    system bin/"flutter_rust_bridge_codegen", "--rust-input", "native/api.rs",
                                              "--dart-output", "bridge_generated.dart"
  end
end
