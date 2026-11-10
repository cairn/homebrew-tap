class Cairn < Formula
  desc "Terminal-based coding agent, built by Cairn"
  homepage "https://github.com/cairn/cairn"
  version "0.3.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.6/cairn-code-macos-aarch64"
      sha256 "27ff722e5198fc2741c624dc58f8e6ce2347bc5145193c8e91dac2b06b67fe0b"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.6/cairn-code-macos-x86_64"
      sha256 "e033252cee7f62236d1d86d0ee540c433aa7bf2974dbbe22edc24ff64cf45a4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.6/cairn-code-linux-aarch64"
      sha256 "9454bd0fc6c18039289b69c0d52967c1e27f4e5a116e4a87961522ee18c3bd5e"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.6/cairn-code-linux-x86_64"
      sha256 "ba14c1e223f1c68ae02c852ebc2104995b7ccb23076baf6f0ff82ccc83899410"
    end
  end

  def install
    asset = Dir["cairn-code-*"].first
    bin.install asset => "cairn"
  end

  def caveats
    <<~EOS
      Cairn Code self-updates with `cairn update`. If you installed it with
      Homebrew, prefer `brew upgrade cairn` so Homebrew stays in charge
      of the binary.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cairn --version")
  end
end
