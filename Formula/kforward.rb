# Formula/kforward.rb
class Kforward < Formula
  desc "Port-forwarding helper for Kubernetes services using kubectl"
  homepage "https://github.com/sanspareilsmyn/kforward"
  url "https://github.com/sanspareilsmyn/kforward/archive/refs/tags/0.1.0.tar.gz"
  sha256 "630eae2778efbce76f3ca33cf2248e71b11c335264147b38a714bdd3666475ec"
  license "Apache License 2.0"

  depends_on "go" => :build
  depends_on "kubernetes-cli"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"kforward", "./cmd/kforward"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/kforward --help")
  end
end