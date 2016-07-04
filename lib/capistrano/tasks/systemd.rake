namespace :load do
	task :defaults do
		set :systemd_unit, ->{ fetch :application }
		set :systemd_use_sudo, true
		set :systemd_roles, [:app]
	end
end

namespace :systemd do
	%w[start stop restart status enable disable].each do |command|
		desc "#{command.capitalize} systemd service"
		task command do
			on roles fetch :systemd_roles do
				exec :systemctl, command, fetch(:systemd_unit)
			end
		end
	end

	desc "Reload systemd manager configuration"
	task "daemon-reload" do
		on roles fetch :systemd_roles do
			exec :systemctl, "daemon-reload"
		end
	end

	def exec *args
		fetch(:systemd_use_sudo) ? sudo(*args) : execute(*args)
	end
end

after "deploy:published", "systemd:daemon-reload"
after "deploy:finished", "systemd:restart"
