default_users = JSON.parse(File.read("#{Rails.root}/db/bootstrap/users.json"))
default_labs = JSON.parse(File.read("#{Rails.root}/db/bootstrap/labs.json"))

# Create all default entities from given data
default_users.each do |user|
  User.create(user)
end

default_labs.each do |lab|
  Lab.create(lab)
end