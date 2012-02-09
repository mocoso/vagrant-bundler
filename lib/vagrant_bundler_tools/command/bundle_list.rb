require 'optparse'

module VagrantBundlerTools
  module Command
    class BundleList < Base
      def execute
        env.ui.info ssh_execute("cd /vagrant && bundle list")
      end
    end
  end
end
