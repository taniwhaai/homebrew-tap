class Arai < Formula
  desc "AI coding rules that actually work — enforce instruction files via hooks"
  homepage "https://arai.taniwha.ai"
  version "1.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url "https://github.com/taniwhaai/arai/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-aarch64", using: :nounzip
      sha256 "197a19aa5147c721abc8d374009ff9fa5104ea5718618dcff9dfb2b77fb8a8b2"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-x86_64", using: :nounzip
      sha256 "d6621fb4e24a21ea49d60228899f10d53e6f67acf0a623fc39b72251c8162b53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-aarch64", using: :nounzip
      sha256 "ad5558f9a3bd8683e2babc6e02a16c18395f05e21b715db140534d6066eb0be3"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-x86_64", using: :nounzip
      sha256 "6219d6955c3cdc40a3c07dd4fa0d598fd392ec0f37a3d58a2c6378353be54ede"
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
