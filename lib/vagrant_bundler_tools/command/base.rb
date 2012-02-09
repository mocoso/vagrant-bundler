module VagrantBundlerTools
  module Command
    class Base < Vagrant::Command::Base
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
        output = ''
        with_target_vms(nil, true) do |vm|
          # Basic checks that are required for proper SSH
          raise Errors::VMNotCreatedError if !vm.created?
          raise Errors::VMInaccessible if !vm.state == :inaccessible
          raise Errors::VMNotRunningError if vm.state != :running

          vm.channel.execute(command, :error_check => false) do |type, data|
            output << data.to_s
          end
        end

        output
      end
    end
  end
end
