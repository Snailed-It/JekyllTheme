# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "snailedit"
  spec.version       = "0.1.32"
  spec.authors       = ["Rosemary Orchard", "Snailed It"]
  spec.email         = ["hello@snailedit.dev"]

  spec.summary       = "Snailed It's Jekyll Theme."
  spec.homepage      = "https://snailedit.dev"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
