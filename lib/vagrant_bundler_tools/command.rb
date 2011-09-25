module VagrantBundlerTools
  class Command < Vagrant::Command::GroupBase
    register "bundle", "Commands to interact with bundled gems on guest"

    desc "show GEM_NAME", "Show location of guest's bundled gem on host file system"
    def show(gem_name)
      env.ui.info locate_gem(gem_name)
    end

    desc "open GEM_NAME", "Open guest's bundled gem with host's editor"
    def open(gem_name)
      # Method largely copied and pasted from from Bundler::CLI#open
      editor = [ENV['BUNDLER_EDITOR'], ENV['VISUAL'], ENV['EDITOR']].find{|e| !e.nil? && !e.empty? }
      if editor
        gem_path = locate_gem(gem_name)
        Dir.chdir(gem_path) do
          command = "#{editor} #{gem_path}"
          success = system(command)
          env.ui.info "Could not run '#{command}'" unless success
        end
      else
        env.ui.info("To open a bundled gem, set $EDITOR or $BUNDLER_EDITOR")
      end
    end

    protected

      def locate_gem(gem_name)
        guest_path = ssh_execute("cd /vagrant && bundle show #{gem_name}").strip
        unless guest_path.start_with?('/vagrant/')
          raise Errors::BundlePathOutsideVagrantDirectory.new
        end
        host_path = guest_path.gsub(%r{^/vagrant/}, '')
        File.expand_path(host_path)
      end

      def ssh_execute(command)
        ssh_vm.ssh.execute do |ssh|
          ssh.exec!(command)
        end
      end

      def ssh_vm
        @ssh_vm ||= begin
          vm = target_vms.first

          # Basic checks that are required for proper SSH
          raise Vagrant::Errors::VMNotCreatedError if !vm.created?
          raise Vagrant::Errors::VMInaccessible if !vm.vm.accessible?
          raise Vagrant::Errors::VMNotRunningError if !vm.vm.running?

          vm
        end
      end
  end
end
