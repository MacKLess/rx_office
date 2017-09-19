require('rspec')
require('pg')
require('doctor')

DB = PG.connect({:dbname => 'rx_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end
end

describe(Doctor) do
  describe('.all') do
    it('is empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

    describe('#==') do
      it('is the same doctor if it has the same name') do
        doctor1 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method"})
        doctor2 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method"})
        expect(doctor1).to(eq(doctor2))
      end
    end

end
