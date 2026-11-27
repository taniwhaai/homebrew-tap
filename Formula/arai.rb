class Arai < Formula
  desc "AI coding rules that actually work — enforce instruction files via hooks"
  homepage "https://arai.taniwha.ai"
  version "1.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url "https://github.com/taniwhaai/arai/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-aarch64", using: :nounzip
      sha256 "aa75362db0b720cbfa2ca74089467ac3a05b991b11ec37e06c1b2ebb4c999e6c"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-x86_64", using: :nounzip
      sha256 "2edbd8071a57ce42ddf3557570c23ca3d190cf94583afde3add681a231070330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-aarch64", using: :nounzip
      sha256 "6d74a0c8c8488e2ca260c018038fea241a0c7bf1dd030d14ccb213d8cbdecb3a"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-x86_64", using: :nounzip
      sha256 "f5f25356d08e5d2e6b957ab2c7336efd900db05fb43be70299ce889c4c5a0b69"
    end
  end

  def install
    # Release assets are raw binaries named arai-<os>-<arch>.
    binary = Dir["arai*"].find { |f| !f.end_with?(".bundle", ".txt", ".jsonl") }
    odie "could not locate release binary in the download stage" if binary.nil?
    bin.install binary => "arai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arai --version")
  end
end
