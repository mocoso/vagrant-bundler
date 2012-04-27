require 'optparse'

module VagrantBundler
  module Command
    class BundleShow < Base
      def execute
        opts = OptionParser.new do |opts|
          opts.banner = "Show the path to a bundle gem on the vagrant box"
          opts.separator ""
          opts.separator "Usage: vagrant bundle show <gem_name>"
        end

        # Parse the options
        argv = parse_options(opts)

        return if !argv

        raise Vagrant::Errors::CLIInvalidUsage, :help => opts.help.chomp if argv.length < 1

        @env.ui.info locate_gem(argv[0])
      end
    end
  end
end
