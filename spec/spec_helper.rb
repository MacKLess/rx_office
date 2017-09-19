require('rspec')
require('pg')
require('patient')
require('doctor')
require('pry')

DB = PG.connect({:dbname => 'rx_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
  end
end
