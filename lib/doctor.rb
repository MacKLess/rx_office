class Doctor
  attr_accessor(:name, :speciality)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
  end

    def self.all
      returned_doctors = DB.exec("SELECT * FROM doctors;")
      doctors = []
      returned_doctors.each do |doctor|
        name = name.fetch('name')
        speciality = speciality.fetch('speciality')
        doctors.push(Doctor.new({:name => name, :speciality => speciality}))
      end
      doctors
    end

    def ==(another_doctor)
      self.name.==(another_doctor.name)
    end

end
