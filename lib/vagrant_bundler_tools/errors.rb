module VagrantBundlerTools
  module Errors
    class BundlePathOutsideVagrantDirectory < Vagrant::Errors::VagrantError
      error_key(:bundle_path_outside_vagrant_directory, "vagrant_bundler_tools.errors")
    end
  end
end
