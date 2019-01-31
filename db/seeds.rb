# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning...'

Status.destroy_all

puts 'Load seeds'

seeds = YAML.load(open('db/seeds.yml').read)

puts 'Create statuses'

seeds['statuses'].each do |status|
  code = status.first
  description = status.last
  status = Status.new(code: code, description: description )
  status.save
  puts "#{code} created"
end