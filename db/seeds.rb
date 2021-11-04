# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Position.create([
    { role: 'Applicant', member: false },
    { role: 'Member' },
    { role: 'President', can_change_positions: 'true', can_change_events: 'true', can_change_roster: 'true', can_change_payments: 'true' }
])

Member.create([
    { email: 'sfk.website.431@gmail.com', full_name: 'Test Admin', position_id: '3' },
    { email: 'sclark@tamu.edu', full_name: 'Steven Clark', position_id: '2' }
])
