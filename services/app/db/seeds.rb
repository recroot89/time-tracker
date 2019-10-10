# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Insert fixtures'
`rails db:fixtures:load`

puts 'Insert employees seeds'
30.times do
  params = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    position: 'Rower',
    personnel_number: SecureRandom.hex(2).upcase,
    tin: SecureRandom.hex(4).upcase,
    birth_date: Faker::Date.birthday,
    begin_date: rand(1..10).years.ago,
    department: Department.where(name: 'Rowers', company_id: Company.find_by(name: 'Galleys')).first
  }

  t = Employee.new(params)
  t.save!
end
