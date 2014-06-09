require 'spec_helper'

feature 'Viewing tickets' do  
	before do 
		user = FactoryGirl.create(:user)
		textmate_2 = FactoryGirl.create(:project, name: 'TextMate 2')

		ticket = FactoryGirl.create(:mticket, 
				project: textmate_2,
				title: 'Make it shinny',
				description: 'This is first description for a ticket')
		ticket.update(user: user)
		internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')

		FactoryGirl.create(:mticket, 
				project: internet_explorer,
				title: 'Standards compliance',
				description: "Isn't it a joke.")
		define_permission!(user, "view", textmate_2)
		sign_in_as!(user)
		visit '/'
	end

	scenario 'Viewing tickets for a given project' do 

		click_link 'TextMate 2'
		expect(page).to have_content "Make it shinny"
		expect(page).to_not have_content "Standards compliance"

		click_link "Make it shinny"
		within("#mticket h2") do 
			expect(page).to have_content("Make it shinny")
		end

		expect(page).to have_content("This is first description for a ticket")
	end
end