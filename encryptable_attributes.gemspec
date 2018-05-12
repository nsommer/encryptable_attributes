
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "encryptable_attributes/version"

Gem::Specification.new do |spec|
  spec.name          = "encryptable_attributes"
  spec.version       = EncryptableAttributes::VERSION
  spec.authors       = ["Nils Sommer"]
  spec.email         = ["mail@nilssommer.de"]

  spec.summary       = "DSL for encryption and decryption of attributes in ActiveRecord models"
  spec.homepage      = "https://github.com/nsommer/encryptable_attributes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "standalone_migrations"
  spec.add_development_dependency "sqlite3"
end
