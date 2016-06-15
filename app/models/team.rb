class Team < ActiveRecord::Base
	require 'csv'
	
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
	has_attached_file :picture, sytles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: ""
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
	
	def self.import(file)
		CSV.parse(file.read, col_sep: "|", headers: false) do |row|
			#row[0] = ? (number)
			#row[1] = Team Number
			#row[2] = Team Name
			#row[3] = School Name
			#row[4] = City
			#row[5] = State
			#row[6] = Country
			#row[7] = Has Advanced
			#row[8] = ? (boolean)
			#row[9] = ? (number)
			puts row.inspect
			if(Team.exists?(row[1].to_i))
				@team = Team.find(row[1].to_i)
				# TODO patch here incase something changed
				puts "Team exists already"
			else
				@team = Team.new(:id => row[1].to_i, :name => row[2], :school => row[3], :city => row[4], :state => row[5], :country => row[6])
				puts @team.inspect
				@team.save
			end
		end
		#Team.create! 
	end
end
