require 'rake'
require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'bundler'

Bundler.setup
Bundler::GemHelper.install_tasks

desc 'Default: run unit tests.'
task :default => :test

desc "Clean generated files"
task :clean do
  #rm FileList['test/']
  rm_rf 'pkg'
  rm_rf 'rdoc'
end

RSpec::Core::RakeTask.new(:spec)

desc 'Generate documentation for the pachuber gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'pachuber'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.textile')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
