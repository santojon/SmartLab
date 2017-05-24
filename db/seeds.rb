# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# ruby encoding: utf-8

# Data for all default users
default_users = [
  ['Admin', 11111111111, 'admin', true],
  ['User', 22222222222, 'user', false]
]

# Create all default users from given data
default_users.each do |name, cpf, password, admin|
  User.create(name: name, cpf: cpf, password: password, admin: admin)
end