class Vnclm < Formula
  desc "CLI for the Vinculum Kubernetes AI-agent platform"
  homepage "https://github.com/FlorianWenzel/vinculum"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-arm64"
      sha256 "52e0ae4ff204072c754dcf05f466f32c05fe5e4ca438df38776447e66156c35f"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-amd64"
      sha256 "439ddb757a1136f1f988d51fb9e9cfb93256b1fdedf2ca89490700b4ffc75f3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-arm64"
      sha256 "d38ce88785180a29c921504b84011f6e20f19e01ac7a53267a7a7d07404c96ca"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-amd64"
      sha256 "453cfd0f3a6b8618a91d9c6bcbf3cf44463ba941be0d2e9137d97b7fab416f54"
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
