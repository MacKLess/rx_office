class Doctor
  attr_accessor(:name, :speciality)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    # @speciality = attributes.fetch(:speciality)
  end

    def ==(another_doctor)
      self.name.==(another_doctor.name)
    end
end
