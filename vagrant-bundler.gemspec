# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "vagrant-bundler"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joel Chippindale"]
  s.date = "2012-04-28"
  s.description = "vagrant-bundler is a vagrant plugin to make it possible to interact\nwith the guest's bundled gems directory from the host.\n"
  s.email = "joel@joelchippindale.com"
  s.extra_rdoc_files = ["README.mdown"]
  s.files = ["README.mdown", "lib/vagrant_bundler", "lib/vagrant_bundler.rb", "lib/vagrant_bundler/command", "lib/vagrant_bundler/command/base.rb", "lib/vagrant_bundler/command/bundle.rb", "lib/vagrant_bundler/command/bundle_list.rb", "lib/vagrant_bundler/command/bundle_open.rb", "lib/vagrant_bundler/command/bundle_show.rb", "lib/vagrant_bundler/errors.rb", "lib/vagrant_init.rb", "templates/locales", "templates/locales/en.yml"]
  s.homepage = "http://github.com/mocoso/vagrant-bundler"
  s.rdoc_options = ["--main", "README.mdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Vagrant plugin for working with the guest's bundled gems"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vagrant>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<i18n>, [">= 0.5.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<vagrant>, [">= 1.0.2"])
      s.add_dependency(%q<i18n>, [">= 0.5.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<vagrant>, [">= 1.0.2"])
    s.add_dependency(%q<i18n>, [">= 0.5.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
