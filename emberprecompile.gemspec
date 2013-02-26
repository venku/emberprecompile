# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emberprecompile/version'

Gem::Specification.new do |gem|
  gem.name          = "emberprecompile"
  gem.version       = Emberprecompile::VERSION
  gem.authors       = ["Venkatesh Kommineni"]
  gem.email         = ["vkommineni@hotmail.com"]
  gem.description   = %q{Handlebars pre compiler for Ember JS}
  gem.summary       = %q{Pre compiles handlebars for Ember JS}
  gem.homepage      = "https://github.com/venku/emberprecompile"

  gem.files         = Dir.glob("*")
  gem.files         += Dir.glob("lib/**/*")
  gem.executables   = %w(emberprecompile)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "barber", "=0.3.0"
  gem.add_dependency "fssm"
  
  gem.add_development_dependency "rake"
end
