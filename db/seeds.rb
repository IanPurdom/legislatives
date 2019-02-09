# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning...'

Audit.destroy_all
Deputy.destroy_all
Candidate.destroy_all
Status.destroy_all
Election.destroy_all
User.destroy_all
Role.destroy_all
Department.destroy_all


puts 'create election'

Election.create!(name:'Législatives', election_date:('27/07/1981').to_date)

puts 'Load seeds'

seeds = YAML.load(open('db/seeds.yml').read)

puts 'Create statuses...'

n = 1
seeds[:statuses].each do |number, value|
  order = n 
  code = value['code']
  description = value['description']
  next_action = value['next_action']
  status = Status.new(code: code, description: description, order: order, next_action: next_action )
  status.save
  puts "#{code} #{order} number created"
  n += 1
end

puts 'create roles...'

  seeds[:roles].each do |number, value|
    code = value['code']
    description = value['description']
    Role.create!(code: code, description: description)
    puts "Role #{code} created"
  end

puts 'create departments...'

YAML.load(open('db/departments.yml').read).each_slice(2).to_a.each do |dep|
  Department.create!(name: dep.first, code: dep.last)
  puts "#{dep.first}-#{dep.last} created"
end

puts 'create users...'

seeds[:users].each do |number, value|
  first_name = value['first_name']
  last_name = value['last_name']
  email = value['email']
  department = Department.find_by(code: value['department'])
  role = Role.find_by(code: value['role'])
  password = value['password']
  password_confirmation = value['password_confirmation']
  User.create!(first_name: first_name, last_name: last_name, 
                email: email, department_id: department.id, 
                role_id: role.id, password: password, 
                password_confirmation: password_confirmation)
  puts "#{first_name}-#{last_name} created"
end

puts 'create candidates...'

seeds[:candidates].each do |number, value|
  user = User.find_by(last_name: value['user'])
  status = Status.find_by(code: value['status'])
  election = Election.find_by(name: 'Législatives')
  address = value['address']
  district = value['district']
  profession = value['profession']
  mandate = value['mandate']
  secretary = User.find_by(last_name: value['secretary'])
  Candidate.create!(user_id: user.id, status_id: status.id, election_id: election.id, 
                    address: address, district: district, profession: profession, 
                    mandate: mandate)
  puts "Candidate #{user.first_name} #{user.last_name} created"
end

puts 'create deputies...'

seeds[:deputies].each do |number, value|
  candidate = Candidate.find(User.find_by(last_name: value['candidate']).candidate.id)
  first_name = value['first_name']
  last_name = value['last_name']
  profession = value['profession']
  email = value['email']
  address = value['address']
  deputy = Deputy.create!(candidate_id: candidate.id, first_name: first_name, last_name: last_name, profession: profession, email: email, address: address )
  puts "Deputy #{deputy.first_name} #{deputy.last_name} created"
end






