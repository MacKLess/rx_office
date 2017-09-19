class Patient
  attr_reader(:name, :birthday, :id, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      id = patient.fetch("id").to_i
      doctor_id = patient.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :id => id, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', '#{@doctor_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
    found_patient = nil
    Patient.all.each do |patient|
      if patient.id == id
        found_patient = patient
      end
    end
  found_patient
  end

  def ==(another_patient)
    self.name().==(another_patient.name()).&(self.birthday().==(another_patient.birthday)).&(self.id().==(another_patient.id())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

end
