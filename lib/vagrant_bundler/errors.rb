module VagrantBundler
  module Errors
    class BundlePathOutsideVagrantDirectory < Vagrant::Errors::VagrantError
      error_key(:bundle_path_outside_vagrant_directory, "vagrant_bundler.errors")
    end

    class GemNotFound < Vagrant::Errors::VagrantError
      def initialize(message)
        # We inherit from Vagrant::Errors::VagrantError so that Vagrant
        # handles this error like other VagrantErrors but we want to skip
        # VagrantError#initialize to avoid i18n translations, because we are
        # just passing on the message 'bundle show' returns
        #
        # This call effectively calls initialize on VagrantError's superclass
        # StandardError
        StandardError.instance_method(:initialize).bind(self).call(message)
      end
    end
  end
end
