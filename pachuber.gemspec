# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require "pachuber"
require "pachuber/version"

Gem::Specification.new do |s|
  s.name        = "pachuber"
  s.version     = Pachuber::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kit Plummer"]
  s.email       = "kitplummer@dozersoftware.com"
  s.homepage    = "http://github.com/kitplummer/pachuber"
  s.summary     = "pachuber-#{Pachuber::VERSION}"
  s.description = "Just a simple Ruby library to provides Ruby-style abstraction around the HTTP API at Pachube."

  s.rubygems_version   = "1.3.7"

  s.extra_rdoc_files = [ "README.textile" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
  s.files = ["Rakefile", "pachuber.gemspec", "Gemfile", "README.textile"] +
  Dir.glob("lib/**/*")
  s.post_install_message = %Q{**************************************************
  Thank you for installing #{s.summary}
  Copyright 2010 - Dozer Software LLC.
**************************************************
}

end
