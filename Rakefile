require 'rubygems'
require 'rake/gempackagetask'

require 'merb-core'
require 'merb-core/tasks/merb'

GEM_NAME = "extlib-present"
GEM_VERSION = "0.0.2"
AUTHOR = "Genki Takiuchi"
EMAIL = "genki@s21g.com"
HOMEPAGE = "http://blog.s21g.com/genki"
RUBYFORGE_PROJECT = 'asakusarb'
SUMMARY = "Merb plugin that provides :present? method to Object"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'merb'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('extlib', '>= 0.9.9')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
	pkg.need_tar = true
  pkg.gem_spec = spec
end

desc "install the plugin as a gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Run specs"
task :spec do
  sh "spec spec --color"
end

desc 'Package and upload the release to rubyforge.'
task :release => :package do |t|
  require 'rubyforge'
	v = ENV["VERSION"] or abort "Must supply VERSION=x.y.z"
	abort "Versions don't match #{v} vs #{GEM_VERSION}" unless v == GEM_VERSION
	pkg = "pkg/#{GEM_NAME}-#{GEM_VERSION}"

	require 'rubyforge'
	rf = RubyForge.new.configure
	puts "Logging in"
	rf.login

	c = rf.userconfig
#	c["release_notes"] = description if description
#	c["release_changes"] = changes if changes
	c["preformatted"] = true

	files = [
		"#{pkg}.tgz",
		"#{pkg}.gem"
	].compact

	puts "Releasing #{GEM_NAME} v. #{GEM_VERSION}"
	rf.add_release RUBYFORGE_PROJECT, GEM_NAME, GEM_VERSION, *files
end

task :default => :spec
