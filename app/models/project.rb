class Project < ActiveRecord::Base
	has_many :pledges
	has_many :rewards
	accepts_nested_attributes_for :rewards

		def total
			total = 0
			pledges.each do |pledge|
				total += pledge.amount unless pledge.amount == nil
			end 
			total
		end

		def percentage
			percentage = @project.goal
			return percentage
		end

end
