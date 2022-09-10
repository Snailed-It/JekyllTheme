# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "snailedit"
  spec.version       = "0.1.8"
  spec.authors       = ["Rosemary Orchard"]
  spec.email         = ["16113535+RosemaryOrchard@users.noreply.github.com"]

  spec.summary       = "Snailed It's Jekyll Theme."
  spec.homepage      = "https://snailedit.dev"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
