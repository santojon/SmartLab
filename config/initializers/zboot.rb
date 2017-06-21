# Data for all default entities
default_users = JSON.parse(File.read("#{Rails.root}/db/bootstrap/users.json"))

# Create all default entities from given data
default_users.each do |user|
  User.create(user)
end