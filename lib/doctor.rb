class Doctor
  attr_reader(:name, :speciality, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch('name')
      speciality = doctor.fetch('speciality')
      id = doctor.fetch('id').to_i
      doctors.push(Doctor.new({:name => name, :speciality => speciality, :id => id}))
    end
    doctors
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all.each do |doctor|
      if doctor.id == id
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
    @id = result.first.fetch('id').to_i
    # binding.pry
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.speciality().==(another_doctor.speciality())).&(self.id().==(another_doctor.id()))
  end

  def patients
    # puts "SELECT * FROM patients WHERE doctor_id = #{@id};"
    returned_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{@id};")
    patients = []
    # binding.pry
    returned_patients.each do |patient|
      name = patient.fetch('name')
      birthday = patient.fetch('birthday')
      id = patient.fetch('id').to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :id => id, :doctor_id => @id}))
    end
    patients
  end
end
