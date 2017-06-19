# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# ruby encoding: utf-8

# Data for all default entities
default_users = JSON.parse(File.read("#{Rails.root}/db/bootstrap/users.json"))
default_labs = JSON.parse(File.read("#{Rails.root}/db/bootstrap/labs.json"))
default_desks = JSON.parse(File.read("#{Rails.root}/db/bootstrap/desks.json"))
default_equipments = JSON.parse(File.read("#{Rails.root}/db/bootstrap/equipments.json"))
default_incidents = JSON.parse(File.read("#{Rails.root}/db/bootstrap/incidents.json"))

# Create all default entities from given data
default_users.each do |user|
  User.create(user)
end

default_labs.each do |lab|
  Lab.create(lab)
end

default_desks.each do |desk|
  desk['lab'] = Lab.find(desk['lab'])
  Desk.create(desk)
end

default_equipments.each do |equipment|
  equipment['desk'] = Desk.find(equipment['desk'])
  Equipment.create(equipment)
end

default_incidents.each do |incident|
  incident['user'] = User.find(incident['user'])
  Incident.create(incident)
end