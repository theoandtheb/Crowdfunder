class Reward < ActiveRecord::Base
	belongs_to :projects
	belongs_to :pledges
	belongs_to :user :through => :projects

end
