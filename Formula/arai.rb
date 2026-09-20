class Arai < Formula
  desc "AI coding rules that actually work — enforce instruction files via hooks"
  homepage "https://arai.taniwha.ai"
  version "1.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url "https://github.com/taniwhaai/arai/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-aarch64", using: :nounzip
      sha256 "790a6776f628825430494ef9f79dcd82598ba9dfae3b397181d1a12e1d3adb90"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-x86_64", using: :nounzip
      sha256 "37d7434dcf62e1b512abfc2fe671be71fd26a2a8eb8b2956c2ffe24c023888af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-aarch64", using: :nounzip
      sha256 "1dd0ec6fe006e5637fba4c976b3937f8195d26090adf0c2a24663098c55b487c"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-x86_64", using: :nounzip
      sha256 "d70e2d2c99d4660877d393bc7ace30ef00fe6bdc7525f3658e99070f468b11fc"
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
