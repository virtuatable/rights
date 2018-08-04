require 'bundler'
Bundler.require(ENV['RACK_ENV'].to_sym || :development)

$stdout.sync = true

service = Arkaan::Utils::MicroService.instance
  .register_as('rights')
  .from_location(__FILE__)
  .in_standard_mode

map(service.path) { run Controllers::Categories.new }

at_exit { Arkaan::Utils::MicroService.instance.deactivate! }