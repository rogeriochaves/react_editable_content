$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'paperclip/version'

Gem::Specification.new do |s|
  s.name              = "editable_content"
  s.version           = Paperclip::VERSION
  s.platform          = Gem::Platform::RUBY
  s.author            = "Rogério Chaves"
  s.email             = ["rogerio@react.ag"]
  s.homepage          = "https://github.com/rogeriochaves/editable_content"
  s.summary           = "Easily edit static content from the front-end"
  s.description       = "Change text and images from the browser"
  s.license           = "MIT"

  #s.rubyforge_project = "editable_content"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency('paperclip', '>= 4.1.1')

  s.add_development_dependency('sqlite3', '~> 1.3.9')
  s.add_development_dependency('activerecord', '>= 4.1.1')
  s.add_development_dependency('mocha', '>= 1.0.0')

end