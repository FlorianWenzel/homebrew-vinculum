class Vnclm < Formula
  desc "CLI for the Vinculum Kubernetes AI-agent platform"
  homepage "https://github.com/FlorianWenzel/vinculum"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-arm64"
      sha256 "c694e249fa66cdefb37ed31a3c3532b856fb5b2942f5c37bee18a5e428a7ae3f"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-amd64"
      sha256 "b26b20ac997b3b90315d7106a3b23c25ad6fba1dc80b3eabac6d15fbf16341e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-arm64"
      sha256 "768346e8f5cced80a6c5191830b192716a866c1f28d8723c4d0b4ce3bc9bf18a"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-amd64"
      sha256 "7887414bd0ebda529feab0048d231e4a66a8af6ea2aa1b7ad76396674db2d9a6"
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
