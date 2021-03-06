require('spec_helper')

describe(Patient) do
  describe('.all') do
    it('starts off with no patients') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you add a patient to the database of patients') do
      patient = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      patient.save
      expect(Patient.all()).to(eq([patient]))
    end
  end

  describe('#name') do
    it('tells you the name of patient') do
      patient = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      patient.save
      expect(patient.name).to(eq("Professor Plum"))
    end
  end

  describe('#id') do
    it('sets patient ID when you save it') do
      patient = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      patient.save
      expect(patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#doctor_id') do
    it('tells you name of doctor id') do
      patient = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
    end
  end
  
  describe('.find') do
    it('returns a patient by their id') do
      patient1 = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      patient1.save
      patient2 = Patient.new({:name => "B. Munchausen", :birthday => "1989-03-10", :id => nil, :doctor_id => 4})
      patient2.save
      expect(Patient.find(patient2.id)).to(eq(patient2))
    end
  end

  describe("#==") do
    it('is the same patient if they have the same name, birthday, ID, and doctor ID') do
      patient1 = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      patient2 = Patient.new({:name => "Professor Plum", :birthday => "1892-07-10", :id => nil, :doctor_id => 2})
      expect(patient1).to(eq(patient2))
    end
  end


end
