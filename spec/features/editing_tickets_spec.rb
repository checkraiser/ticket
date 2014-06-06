require 'spec_helper'

feature 'Editing tickets' do  
	let!(:project) { FactoryGirl.create(:project) }
	let!(:mticket) { FactoryGirl.create(:mticket, project: project) }

	before do 
		visit '/'
		click_link project.name
		click_link mticket.title
		click_link "Edit Ticket"
	end

	scenario "Updating a ticket" do  
		fill_in "Title", with: 'Make it really shinny'
		click_button "Update Mticket"

		expect(page).to have_content "Ticket has been updated."

		within("#mticket h2") do 
			expect(page).to have_content("Make it really shinny")
		end

		expect(page).to_not have_content mticket.title
	end
end