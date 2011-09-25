require 'vagrant'
require 'vagrant_bundler_tools/command'
require 'vagrant_bundler_tools/errors'

module VagrantBundlerTools

  # The source root is the path to the root directory of
  # the VagrantBundlerTools gem.
  def self.source_root
    @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
  end
end

# # Default I18n to load the en locale
I18n.load_path << File.expand_path("templates/locales/en.yml", VagrantBundlerTools.source_root)
