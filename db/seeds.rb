# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# jim_beam = Patient.create(name: "Jim Beam", age: 56, sex: "Male")
# johnny_walker = Patient.create(name: "Johnny Walker", age: 75, sex: "Male")
# aunt_jemima = Patient.create(name: "Aunt Jemima", age: 60, sex: "Female")
#
# doctor_octopus = Doctor.create(name: "Doc Ock", specialization: "cyberneticist")
# doctor_evil = Doctor.create(name: "Doctor Evil", specialization: "General Practitioner")
# doctor_octagon = Doctor.create(name: "Doctor Octagon",specialization: "gastroenterologist")
# doctor_strange = Doctor.create(name: "Doctor Strange", spec: "heart surgeon")
#
# congenital_heart_failure = Diagnosis.create(name: "congenital_heart_failure", doctor_id:  doctor_strange.id, patient_id: aunt_jemima.id)
# ibs = Diagnosis.create(name: "IBS", doctor_id: doctor_octagon.id, patient_id: aunt_jemima.id )
# cirrhosis = Diagnosis.create(name: "cirrhosis", doctor_id: doctor_evil.id, patient_id: jim_beam.id)
# cirrhosis = Diagnosis.create(name: "cirrhosis", doctor_id: doctor_evil.id, patient_id: johnny_walker.id)
#  stroke = Diagnosis.create(name: "stroke", doctor_id: doctor_strange.id, patient_id: jim_beam.id)


  5.times do
    Doctor.create!({
        name: FFaker::Name.name,
        specialization: ["cyberneticist", "General Practitioner", "Heart Surgeon"].sample
      })
  end

  5.times do
    Patient.create!({
        name: FFaker::Name.name,
        age: rand(75),
        sex: ["Male", "Female"].sample
      })
  end

  Patient.all.each do |patient|
    Diagnosis.create!({
        name: ["IBS", "ADHD", "cirrhosis", "plauge"].sample,
        patient_id: patient.id,
        doctor_id: Doctor.all.sample.id
      })
  end
