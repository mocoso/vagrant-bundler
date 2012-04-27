module VagrantBundler
  module Command
    class BundleOpen < Base
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

        # Method largely copied and pasted from from Bundler::CLI#open
        editor = [ENV['BUNDLER_EDITOR'], ENV['VISUAL'], ENV['EDITOR']].find{|e| !e.nil? && !e.empty? }
        if editor
          gem_path = locate_gem(argv[0])
          Dir.chdir(gem_path) do
            command = "#{editor} #{gem_path}"
            success = system(command)
            @env.ui.info "Could not run '#{command}'" unless success
          end
        else
          @env.ui.info("To open a bundled gem, set $EDITOR or $BUNDLER_EDITOR")
        end
      end
    end
  end
end
