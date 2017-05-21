# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create(a_code: 'UTH')
Airport.create(a_code: 'BKK')
Airport.create(a_code: 'SGN')
Airport.create(a_code: 'HKT')
Airport.create(a_code: 'PEK')


airports = Airport.all


5.times do
  date                = Faker::Date.forward(15)
  30.times do
    start_airport     = airports.sample
    finish_airport_id = (airports - [start_airport]).sample.id
    start_airport_id  = start_airport.id
    duration          = nil
    departure         = Faker::Time.between(date.beginning_of_day, date.end_of_day, :day)

    Flight.create(start_airport_id: start_airport_id,
                  finish_airport_id: finish_airport_id,
                  departure: departure,
                  duration: duration
                  )
  end
end
