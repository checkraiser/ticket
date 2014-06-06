class Project < ActiveRecord::Base
	validates :name, presence: true

	has_many :mtickets, :dependent => :delete_all
end
