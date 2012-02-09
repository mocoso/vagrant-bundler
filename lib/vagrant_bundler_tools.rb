require 'vagrant'
require 'vagrant_bundler_tools/command/base'
require 'vagrant_bundler_tools/command/bundle'
require 'vagrant_bundler_tools/command/bundle_list'
require 'vagrant_bundler_tools/command/bundle_open'
require 'vagrant_bundler_tools/command/bundle_show'
require 'vagrant_bundler_tools/errors'

module VagrantBundlerTools

  # The source root is the path to the root directory of
  # the VagrantBundlerTools gem.
  def self.source_root
    @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
  end
end

Vagrant.commands.register(:bundle) { VagrantBundlerTools::Command::Bundle }

# # Default I18n to load the en locale
I18n.load_path << File.expand_path("templates/locales/en.yml", VagrantBundlerTools.source_root)
