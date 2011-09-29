require "rubygems"
require "rubygems/package_task"
require "rdoc/task"
require 'rake/testtask'


task :default => :package do
  puts "Don't forget to write some tests!"
end

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "vagrant-bundler-tools"
  s.version           = "0.0.1"
  s.summary           = "Vagrant plugin for working with the guest's bundled gems"
  s.author            = "Joel Chippindale"
  s.email             = "joel@joelchippindale.com"
  s.homepage          = "http://github.com/mocoso/vagrant-bundler-tools"
  s.description = <<-EOF
vagrant-bundle-tools in a vagrant plugin to make it possible to interact
with the guest's bundled gems directory from the host.
EOF

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.mdown)
  s.rdoc_options      = %w(--main README.mdown)

  # Add any extra files to include in the gem
  s.files             = %w(README.mdown) + Dir.glob("{lib,templates}/**/*")
  s.require_paths     = ["lib"]

  # If you want to depend on other gems, add them here, along with any
  # relevant versions
  s.add_dependency("vagrant", ">= 0.7.0")
  s.add_dependency("i18n", ">= 0.5.0")

  # If your tests use any gems, include them here
  s.add_development_dependency("rake")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("minitest")
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more
# about that here: http://gemcutter.org/pages/gem_docs
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec

# Generate documentation
RDoc::Task.new do |rd|
  rd.main = "README.mdown"
  rd.rdoc_files.include("README.mdown", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
