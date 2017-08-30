# Capistrano::Systemd

This gem add tasks into capistrano for systemd commands (start, stop, restart, status, enable, disable, etc.) on the target machine. It performs `systemctl restart` after deploy as well.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-systemd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-systemd

## Usage

This gem lets you perform `systemctl` command on the target machine. Be sure that you have permission to do that. Set `:systemd_use_sudo` to `true` if you have to run `systemctl` with `sudo`.

Add the following example to your `config/deploy.rb`:

```
set :systemd_unit, -> { "#{fetch :application}.target" }
set :systemd_use_sudo, true
set :systemd_roles, %w(app)
```

and the following to your `Capfile`:

```
require "capistrano/systemd"
```

and do `cap production systemd:status` will show the status of your application.

Run `cap -T systemd` to see the details of commands.

## Troubleshooting

`sudo: no tty present and no askpass program specified`

Make your deploy role runs `sudo systemctl` without asking password.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in the gemspec, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CrBoy/capistrano-systemd.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

