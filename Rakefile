require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'

$:.unshift(File.dirname(__FILE__) + "/lib")
require 'pachuber'

PKG_NAME      = 'pachuber'
PKG_VERSION   = Pachube::VERSION
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

desc 'Default: run unit tests.'
task :default => :test

desc "Clean generated files"
task :clean do
  #rm FileList['test/']
  rm_rf 'pkg'
  rm_rf 'rdoc'
end

desc 'Test the pachuber gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the pachuber gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'pachuber'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.textile')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


# Create compressed packages
spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = PKG_NAME
  s.summary = "Interact with the Pachube API via HTTParty."
  s.description = %q{Just a simple Ruby library to provides Ruby-style abstraction around the HTTP API at Pachube.}
  s.version = PKG_VERSION

  s.author = "Kit Plummer"
  s.email = "kitplummer@gmail.com"
  s.rubyforge_project = PKG_NAME
  s.homepage = "http://github.com/kitplummer/pachuber"

  s.has_rdoc = true
  s.requirements << 'none'
  s.require_path = 'lib'
  #s.autorequire = 'pachuber'
  s.add_dependency("httparty", ">= 0.4.5")
  s.add_dependency("eeml-simple", ">= 0.2.0")
  s.files = [ "Rakefile", "README.textile", "MIT-LICENSE" ]
  s.files = s.files + Dir.glob( "lib/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "resources/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "test/**/*" ).delete_if { |item| item.include?( "\.svn" ) || item.include?("\.png") }
end
  
Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = false
  p.need_zip = true
end
