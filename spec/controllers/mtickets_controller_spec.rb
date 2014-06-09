require 'spec_helper'

describe MticketsController do

	let!(:project) { FactoryGirl.create(:project) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:mticket) { FactoryGirl.create(:mticket, project: project, user: user) }

	context "standard users" do 
		it "cann't access a ticket for a project" do 
			sign_in(user)
			get :show, :id => mticket.id, :project_id => project.id
			expect(response).to redirect_to root_path
			expect(flash[:alert]).to have_content("The project you were looking for could not be found.")
		end
	end
end
