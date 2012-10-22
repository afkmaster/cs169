class Movie < ActiveRecord::Base
	def self.setRatings
		['G', 'PG', 'PG-13', 'R', 'NC-17']
	end
end
