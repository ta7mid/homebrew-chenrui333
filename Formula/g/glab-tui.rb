class GlabTui < Formula
  desc "Terminal interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  url "https://github.com/rcieri/glab-tui/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "ec80641f6ed8429e079c727b861a72709a2bf542fc82946c3e59032799c8c3bb"
  license "MIT"
  head "https://github.com/rcieri/glab-tui.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/chenrui333/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "713f9e223bd0eef3f7d2ec06c94b0a1419a0f712d44f6ec9ccba33650f9a69f5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "79e0b0706109334c93e9776f1ed286b065738f01a02335eda1ae087d6fe55f60"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d8fc71002b148ce34d1959468e3faaefa82c820eaa18a844432f3d685753cf26"
    sha256 cellar: :any,                 arm64_linux:   "efd14e7aeb70eabe40e04ebc6ba828cf3833150b953d83ab39d65fa3f114b0a3"
    sha256 cellar: :any,                 x86_64_linux:  "a1f7d49e77575c8d4629ea4ab6557f5cb8b82a732bbee3fa208fd4153c48857c"
  end

  depends_on "rust" => :build
  depends_on "gh"
  depends_on "glab"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glab-tui --version")
    output = shell_output("#{bin}/glab-tui repos")
    assert_match "Recent repositories:", output
    assert_match "(none)", output
  end
end
