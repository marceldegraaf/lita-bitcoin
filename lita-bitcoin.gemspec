Gem::Specification.new do |spec|
  spec.name          = "lita-bitcoin"
  spec.version       = "1.0.0"
  spec.authors       = ["Marcel de Graaf"]
  spec.email         = ["mail@marceldegraaf.net"]
  spec.description   = %q{A Lita handler to check the current BTC/USD exchange rate}
  spec.summary       = %q{A Lita handler to check the current BTC/USD exchange rate}
  spec.homepage      = "https://github.com/marceldegraaf/lita-bitcoin"
  spec.license       = "MIT"
  spec.metadata      = { lita_plugin_type: "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
end
