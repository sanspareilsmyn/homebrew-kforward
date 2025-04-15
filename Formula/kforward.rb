# Formula/kforward.rb
class Kforward < Formula
  desc "Port-forwarding helper for Kubernetes services using kubectl"
  homepage "https://github.com/sanspareilsmyn/kforward"
  url "https://github.com/sanspareilsmyn/kforward/archive/refs/tags/0.1.1.tar.gz"
  sha256 "b15bd3f2b12120a669c3ea01d53fac473cea56b2bd31fb7784d6e9f61ed4338a"
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