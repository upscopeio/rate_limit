require_relative 'lib/rate/limit/version'

Gem::Specification.new do |spec|
  spec.name          = "rate-limit"
  spec.version       = Rate::Limit::VERSION
  spec.authors       = ["Pablo Fonseca", "Joe d'Elia"]
  spec.email         = ["pablo@upscope.io", "joe@upscope.io"]

  spec.summary       = %q{Rate limit requests}
  spec.description   = %q{Adds rate limit for requests}
  spec.homepage      = "https://github.com/upscopeio/rate-limit"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end