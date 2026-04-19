class Vnclm < Formula
  desc "CLI for the Vinculum Kubernetes AI-agent platform"
  homepage "https://github.com/FlorianWenzel/vinculum"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-arm64"
      sha256 "344347a617326db56e3d8b62f24e926a132eeaa2cc81f718352a9013f4a6162c"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-darwin-amd64"
      sha256 "b64af1fa089bcea619223e53fd02dea584ef45859fbec35dfe83dad67ea89f71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-arm64"
      sha256 "072bef3d2fbe14af7bff0f5e203f6f47f9a88f60a5866363de9d6660cd55f516"
    end
    on_intel do
      url "https://github.com/FlorianWenzel/vinculum/releases/download/v#{version}/vnclm-linux-amd64"
      sha256 "4c76935a7f573638d61d66c413ab8d7b1443b6ef68ec1cd32bb351a11aec50db"
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
