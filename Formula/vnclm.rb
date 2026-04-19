class Vnclm < Formula
  desc "CLI for the Vinculum Kubernetes AI-agent platform"
  homepage "https://github.com/FlorianWenzel/vinculum"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-arm64"
      sha256 "ac7357d7cb8a6257c68c77ef58de1bc10e43b4705ac5127e927dde77ef674b44"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-amd64"
      sha256 "bc7783054aa9f2ca30d50474a6a6e6fc1ed02a78012430c0eb81c5fd8220d79d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-arm64"
      sha256 "df713f6c8e9af89dabdd8bd6a48f32aa5bb17e0bc0627825b9e4f5ebdafb8fc1"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-amd64"
      sha256 "186bb66a8cea61fd60ae4b6e168594484b61fc0a6bc74567de757a57f930b334"
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
