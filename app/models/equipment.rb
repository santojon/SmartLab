class Equipment < ApplicationRecord
	belongs_to :desk
	belongs_to :user
	
	def self.import(file)
		start = false
		spreadsheet = open_spreadsheet(file)
		spreadsheet.each(model: 'model', description: 'description', tag: 'tag', serial: 'serial') do |r|
		  if (start) then
		  	Equipment.create(r)
		  else
		  	start = true
		  end
		end
	end
	
	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
		  when ".csv" then Roo::Spreadsheet.open(file.path, extension: :csv)
		  when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
		  when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)
		  when ".ods" then Roo::Spreadsheet.open(file.path, extension: :ods)
		  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
