require('spec_helper')

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

  describe('.find') do
    it('returns a doctor by their id') do
      doctor1 = Doctor.new({:name => "Dr. Zhivago", :speciality => "Russian method", :id => nil})
      doctor1.save
      doctor2 = Doctor.new({:name => "Dr. Chaney", :speciality => "Lupus", :id => nil})
      doctor2.save
      expect(Doctor.find(doctor2.id)).to(eq(doctor2))
    end
  end

  describe('#patients') do
    it('returns all the patients assigned to a doctor') do
      doctor = Doctor.new({:name => "Dr. Pepper", :speciality => "Energy disorders", :id => nil})
      doctor.save
      # doctors = Doctor.all()
      # # binding.pry
      # doctor = doctors.last
      patient1 = Patient.new({:name => "Cornelius Rooster", :birthday => "1962-02-02", :id => nil, :doctor_id => doctor.id})
      patient2 = Patient.new({:name => "Henri de Toulouse Lautrec", :birthday => "1864-11-24", :id => nil, :doctor_id => doctor.id})
      patient1.save
      patient2.save
      p patient2.doctor_id
      p patient1.doctor_id
      expect(doctor.patients).to(eq([patient1, patient2]))
    end
  end

  describe('#==') do
    it('is the same doctor if they have the same name, speciality, and ID') do
      doctor1 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method", :id => nil})
      doctor2 = Doctor.new({:name => 'Dr. Zhivago', :speciality => "Russian method", :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end

end
