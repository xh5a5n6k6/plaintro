# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "plaintro"
  spec.version       = "0.1.0"
  spec.authors       = ["Chia-Yu Chou"]
  spec.email         = ["chiayu.hank.chou@gmail.com"]

  spec.summary       = "Jekyll theme designed for personal website."
  spec.homepage      = "https://github.com/xh5a5n6k6/plaintro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
