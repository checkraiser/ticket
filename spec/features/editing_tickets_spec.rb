require 'spec_helper'

feature 'Editing tickets' do  
	let!(:user) { FactoryGirl.create(:user)}
	let!(:project) { FactoryGirl.create(:project) }	
	let!(:mticket) do
		mticket = FactoryGirl.create(:mticket, project: project)
		mticket.update(user: user)
		mticket
	end
	before do 
		sign_in_as!(user)
		visit '/'
		click_link project.name
		click_link mticket.title
		click_link "Edit Ticket"
	end

	scenario "Updating a ticket" do  
		fill_in "Title", with: 'xyz'
		click_button "Update Mticket"

		expect(page).to have_content "Ticket has been updated."

		within("#mticket h2") do 
			expect(page).to have_content("xyz")
		end

		expect(page).to_not have_content mticket.title
	end
end