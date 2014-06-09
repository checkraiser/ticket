require 'spec_helper'

feature 'Seed Data' do 

	scenario 'The Basics' do 
		load Rails.root + "db/seeds.rb"
		user = User.where(email: "admin@example.com").first!
		project = Project.where(name: "Ticket Beta").first!
	end
end