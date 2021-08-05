# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "plaintro"
  spec.version       = "0.2.0"
  spec.authors       = ["Chia-Yu Chou"]
  spec.email         = ["xh5a5n6k6@gmail.com"]

  spec.summary       = "Jekyll theme designed for personal websites."
  spec.homepage      = "https://github.com/xh5a5n6k6/plaintro/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"

  # plugin dependency
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.15.1"


  # webrick is no longer a bundled gem in Ruby 3.0,
  # so it needs adding manually.
  # Reference: https://github.com/jekyll/jekyll/issues/8523
  spec.add_runtime_dependency "webrick", "~> 1.7"
end
