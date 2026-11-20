class Cairn < Formula
  desc "Terminal-based coding agent, built by Cairn"
  homepage "https://github.com/cairn/cairn"
  version "0.3.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.9/cairn-code-macos-aarch64"
      sha256 "a1421ed122767ef0e24e31bab3ab569a9b73d8375ea374cbab12618b91229360"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.9/cairn-code-macos-x86_64"
      sha256 "5f7c889fe73fda6601c2239f7f498ac5aada71cc0b08b865bc95f5019754b772"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.9/cairn-code-linux-aarch64"
      sha256 "c1f97f6a6db9f979b04ec35eb7c57983bdde68421e82f29c785226a76bdc8ce1"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.9/cairn-code-linux-x86_64"
      sha256 "43c8c5faac41d6f4c84e752cc63f15b4b73e372d2ae1e1e18a3e4009c421006e"
    end
  end

  def install
    asset = Dir["cairn-code-*"].first
    bin.install asset => "cairn"
    # Claim the generic `agent` name too, as a symlink so upgrades keep
    # it pointing at the current binary.
    bin.install_symlink "cairn" => "agent"
  end

  def caveats
    <<~EOS
      Cairn self-updates with `cairn update`. If you installed it with
      Homebrew, prefer `brew upgrade cairn` so Homebrew stays in charge
      of the binary.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cairn --version")
    assert_match version.to_s, shell_output("#{bin}/agent --version")
  end
end
