class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @patients = []
    load_csv
  end

  def create(patient)
    #...
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"

      room = room_repository.find(row[:room_id]) # Room

      patient = Patient.new(row)
      @patients << patient

      room.add_patient(patient)

      patient.room
    end

    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << [ "id", "name", "cured", "room_id"]
      @patients.each do |patient|
        csv << [ patient.id, patient.name, patient.cured, patient.room.id ]
      end
    end
  end
end

class Patient
  attr_accessor :room

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cure!
    @cured = true
  end
end
