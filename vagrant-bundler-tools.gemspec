# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "vagrant-bundler-tools"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joel Chippindale"]
  s.date = "2012-05-14"
  s.description = "vagrant-bundler-tools has been renamed vagrant-bundler, please install this\ninstead.\n"
  s.email = "joel@joelchippindale.com"
  s.extra_rdoc_files = ["README.mdown"]
  s.files = ["README.mdown"]
  s.homepage = "http://github.com/mocoso/vagrant-bundler"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Vagrant plugin for working with the guest's bundled gems"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vagrant-bundler>, ["= 0.1.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<vagrant-bundler>, ["= 0.1.1"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<vagrant-bundler>, ["= 0.1.1"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
