class Iphonebase < Formula
  desc "Control your iPhone from the command line via macOS iPhone Mirroring"
  homepage "https://github.com/berkozero/iphonebase"
  url "https://github.com/berkozero/iphonebase.git",
    tag:      "v0.1.0",
    revision: "a8260f4"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos => :sequoia

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/iphonebase"
  end

  def caveats
    <<~EOS
      iphonebase requires:
      1. iPhone Mirroring set up and active (macOS Sequoia)
      2. Karabiner-Elements installed (https://karabiner-elements.pqrs.org/)
      3. Screen Recording permission for your terminal app

      Run `iphonebase doctor` to verify all prerequisites.
    EOS
  end

  test do
    assert_match "USAGE: iphonebase", shell_output("#{bin}/iphonebase --help 2>&1", 0)
  end
end
