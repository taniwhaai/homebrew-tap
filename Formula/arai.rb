class Arai < Formula
  desc "AI coding rules that actually work — enforce instruction files via hooks"
  homepage "https://arai.taniwha.ai"
  version "1.1.4"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url "https://github.com/taniwhaai/arai/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-aarch64", using: :nounzip
      sha256 "cdc71f8e7f36d36b09c961d0c8b5db2d4e06f8bece9b300a37bf774e77359d82"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-darwin-x86_64", using: :nounzip
      sha256 "ab9e63a300803070e8028ecbb6812df52628db04707be27abd2077ecebfd8359"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-aarch64", using: :nounzip
      sha256 "7a2f40aa3288cf934e400093f29733c55d6802eb58c89b8b2ad7c1fa27506bca"
    end
    on_intel do
      url "https://github.com/taniwhaai/arai/releases/download/v#{version}/arai-linux-x86_64", using: :nounzip
      sha256 "85d39d98dfd3b94a02414563b7eccd823b999616c7c6c1d44e5f6173d824df91"
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
