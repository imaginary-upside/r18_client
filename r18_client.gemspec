lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "r18_client/version"

Gem::Specification.new do |spec|
  spec.name          = "r18_client"
  spec.version       = R18Client::VERSION
  spec.authors       = ["imaginary-upside"]
  spec.email         = ["imaginary-upside@protonmail.ch"]

  spec.summary       = "r18.com client"
  spec.license       = "AGPL-3.0-only"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.9"
  spec.add_runtime_dependency "rest-client", "~> 2.0"
end
