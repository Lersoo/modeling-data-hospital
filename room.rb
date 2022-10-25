class RoomRepository

end

class Room
  class OverCapacity < StandardError; end

  attr_reader :patients

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    if full?
      raise OverCapacity, "Room is full"
    else
      @patients << patient
      patient.room = self
    end
  end
end
