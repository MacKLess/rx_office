require('rspec')
require('pg')
require('doctor')
require('pry')

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

  describe('#save') do
    it('adds a doctor to the array of saved doctors') do
      doctor = Doctor.new({:name => "Dr. Zhivago", :speciality => "Russian method", :id => nil})
      doctor.save
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe('#name') do
    it('tells you the name of the doctor') do
      doctor = Doctor.new({:name => "Dr. Zhivago", :speciality => "Russian method", :id => nil})
      doctor.save
      expect(doctor.name).to(eq("Dr. Zhivago"))
    end
  end

  describe('#speciality') do
    it('lets you read the speciality of the doctor') do
      doctor = Doctor.new({:name => "Dr. Zhivago", :speciality => "Russian method", :id => nil})
    end
  end

  describe('#id') do
    it('sets the doctor ID when you save it') do
      doctor = Doctor.new({:name => "Dr. Zhivago", :speciality => "Russian method", :id => nil})
      doctor.save
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it('is the same doctor if they have the same name, speciality, and ID') do
      doctor1 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method", :id => nil})
      doctor2 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method", :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end

end
