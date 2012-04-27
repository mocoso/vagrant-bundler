module VagrantBundler
  module Command
    class Base < Vagrant::Command::Base
      protected
      def locate_gem(gem_name)
        bundle_show = ssh_execute("cd /vagrant && bundle show #{gem_name}").strip

        if bundle_show.include?('Could not find gem')
          raise Errors::GemNotFound.new(bundle_show)
        end

        unless bundle_show.start_with?('/vagrant/')
          raise Errors::BundlePathOutsideVagrantDirectory.new
        end

        host_path = bundle_show.gsub(%r{^/vagrant/}, '')
        File.expand_path(host_path)
      end

      def ssh_execute(command)
        output = ''
        with_target_vms(nil, :single_target => true) do |vm|
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
