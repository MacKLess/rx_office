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

    def save
      result = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
      @id = result.first.fetch('id').to_i
      # binding.pry
    end

    def ==(another_doctor)
      self.name().==(another_doctor.name()).&(self.speciality().==(another_doctor.speciality())).&(self.id().==(another_doctor.id()))
    end
end
