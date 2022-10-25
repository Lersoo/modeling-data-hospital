class Appointment
  attr_accessor :id, :doctor, :patient, :date

  def initialize(attributes = {})
    @id = attributes[:id]
    @doctor = attributes[:doctor]
    @patient = attributes[:patient]
    @date = attributes[:date]
  end
end
