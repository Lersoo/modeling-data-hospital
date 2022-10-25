require_relative "room"
require_relative "patient"

room = Room.new(capacity: 2)

john = Patient.new(name: "John")
paul = Patient.new(name: "Paul")

room.add_patient(john)
room.add_patient(paul)

house = Doctor.new(name: "House")

appointment_one = Appointment.new(date: Date.today, patient: john, doctor: house)

p room.patients

p john.room
p paul.room
