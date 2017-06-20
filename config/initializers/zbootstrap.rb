Lab.all.each do |lab|
    lab.delete
end

Desk.all.each do |desk|
    desk.delete
end

Equipment.all.each do |equipment|
    equipment.delete
end

Incident.all.each do |incident|
    incident.delete
end