class Vnclm < Formula
  desc "CLI for the Vinculum Kubernetes AI-agent platform"
  homepage "https://github.com/FlorianWenzel/vinculum"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-arm64"
      sha256 "2c9160561f8b5be52968033e137e2e1e6e2e28680243682c5ec7c37221080cc3"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-amd64"
      sha256 "38f42331b05e95dff2d95dbdc8134d2fbb3741e3487259cd389e23b0cbd27e0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-arm64"
      sha256 "47b73ed4139f12c23412e981dacede672b20ce256cc71bb19ba28894874335d4"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-amd64"
      sha256 "95468385e3e86d793e9b13dc8593bcac50dfef7705e50f371b1d501996cb3cbc"
    end
  end

  def install
    binary_name = "vnclm-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    chmod "+x", binary_name
    bin.install binary_name => "vnclm"

    generate_completions_from_executable(bin/"vnclm", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "vnclm", shell_output("#{bin}/vnclm --help")
  end
end
