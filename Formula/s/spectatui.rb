class Spectatui < Formula
  desc "Terminal dashboard for GitHub Spec-Kit"
  homepage "https://github.com/tinesoft/spectatui"
  url "https://github.com/tinesoft/spectatui/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "bc0eab9e1af23bfaa14cc24a9dd73bc487636e37665947c125b2b3e0a2c2d005"
  license "MIT"
  head "https://github.com/tinesoft/spectatui.git", branch: "develop"

  bottle do
    root_url "https://ghcr.io/v2/chenrui333/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1724696b4af0215445f663db199a98f83dcb9732f698e11050d24889f3ca2737"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "03f2233c6287d54009b57fb4aa07a2944c3be53ae3cf082df302babfb923fac6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8aaf37ffdbedc50348062c16fad099316760a49f055a22b84e2a71df05cc018d"
    sha256 cellar: :any,                 arm64_linux:   "b82d4346d23029b1ebd95f5488d322f27d2c9414c8a8efe472b12f1f298c11c1"
    sha256 cellar: :any,                 x86_64_linux:  "83747d59d44470d60a128aa61a4338575bfe7d87ab0c45142d2d0cfb79190388"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spectatui")
  end

  test do
    # TODO: Upstream does not expose a version command; add a version assertion when available.
    output = shell_output("#{bin}/spectatui --project #{testpath}/missing 2>&1", 1)
    assert_match "failed to discover project", output
    assert_match "project root not found", output
  end
end
