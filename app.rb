require('sinatra')
require('sinatra-contrib')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('pg')

DB = PG.connect({:dbname => "rx_office"})
