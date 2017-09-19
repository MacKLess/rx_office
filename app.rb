require('sinatra')
require('sinatra-contrib')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('pg')
require('pry')

DB = PG.connect({:dbname => "rx_office"})

get('/') do
  erb(:dr_roster)
end

post('/') do
  name = params.fetch('name')
  doctor = Doctor.new({:name => name, :speciality => speciality, :id => id})
  doctor.save
  erb(:dr_roster) #not sure about this
end
