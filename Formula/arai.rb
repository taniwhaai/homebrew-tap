class Arai < Formula
  desc "AI coding rules that actually work — enforce instruction files via hooks"
  homepage "https://arai.taniwha.ai"
  version "1.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url "https://github.com/taniwhaai/arai/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-aarch64", using: :nounzip
      sha256 "5a7b88d57353f3e86abdff3b0e64c860158f0318fb9bf7a12b3b8cae1d9e2163"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-x86_64", using: :nounzip
      sha256 "bc19988f5f821acb0cc4019b469b7e6f9214be8bb65bba891cbbe7a9c3206870"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-aarch64", using: :nounzip
      sha256 "6526978e8a2da787221b9d282c2912096b4ef84790c784f825e13eb684394d3e"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-x86_64", using: :nounzip
      sha256 "d8ee8d96f5b12336cf97333df2e117bccad4acde740eaff263300b9b708ca6a7"
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
