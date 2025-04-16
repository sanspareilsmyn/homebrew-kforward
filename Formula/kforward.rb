# Formula/kforward.rb
class Kforward < Formula
  desc "Port-forwarding helper for Kubernetes services using kubectl"
  homepage "https://github.com/sanspareilsmyn/kforward"
  url "https://github.com/sanspareilsmyn/kforward/archive/refs/tags/0.2.0.tar.gz"
  sha256 "cc67a250c5b0136a26d05a5f2428da3cd1e672b1515f995c1701c2782e1a8e3f"
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