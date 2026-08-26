class Schema < Formula
  desc "Compiler for game network data: one declaration, serializers in six languages"
  homepage "https://github.com/mas-bandwidth/schema"
  url "https://github.com/mas-bandwidth/schema/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "6b47536031d865fd943d62eb796e310d844063ee99d51c734845141736079aac"
  license "AGPL-3.0-or-later"
  head "https://github.com/mas-bandwidth/schema.git", branch: "main"

  depends_on "go" => :build

  def install
    # Stamp the version the binary reports: upstream's Makefile stamps from
    # `git describe`, which a release tarball cannot provide.
    ldflags = "-s -w -X github.com/mas-bandwidth/schema/v2/internal/version.version=v#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema version")

    # The README example: check it, then generate C++ from it.
    (testpath/"example/example.schema").write <<~SCHEMA
      package example

      const MaxHealth = 1000

      enum ShipType { Fighter, Corvette, Bomber }

      flags ShipFlags { Firing, Thrusting, Disabled }

      type Vec3
      {
          x float64
          y float64
          z float64
      }

      type ShipState
      {
          ship_type  ShipType
          ship_flags ShipFlags
          position   Vec3
          health     int32 | min = 0, max = MaxHealth
          at_rest    bool
          if !at_rest
          {
              linear_velocity Vec3
          }
      }
    SCHEMA
    system bin/"schema", "check", testpath/"example"
    system bin/"schema", "generate", "--lang", "cpp", "--out", testpath/"generated", testpath/"example"
    assert_match "namespace example", (testpath/"generated/example.h").read
  end
end
