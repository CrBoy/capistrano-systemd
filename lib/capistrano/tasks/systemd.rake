namespace :load do
	task :defaults do
		set :systemd_unit, ->{ fetch :application }
		set :systemd_use_sudo, false
		set :systemd_roles, %w(app)
	end
end

namespace :systemd do
	%w(start stop restart reload enable disable).each do |command|
		desc "#{command.capitalize} service"
		task command do
			on roles fetch :systemd_roles do
				systemctl :"#{command}", fetch(:systemd_unit)
			end
		end
	end

	desc "Show the status of service"
	task :status do
		on roles fetch :systemd_roles do
			systemctl :status, fetch(:systemd_unit)
		end
	end

	desc "Reload systemd manager configuration"
	task "daemon-reload" do
		on roles fetch :systemd_roles do
			systemctl :"daemon-reload"
		end
	end

	def systemctl(*args)
		fetch(:systemd_use_sudo) ? sudo(:systemctl, *args) : execute(:systemctl, *args)
	end
end
