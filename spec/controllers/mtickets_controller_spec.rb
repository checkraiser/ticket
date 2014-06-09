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

	context "with permission to view project" do 
		before do 
			sign_in(user)
			define_permission!(user, "view", project)
		end
		def cannot_create_ticket!
			response.should redirect_to(project)
			message = "You cannot create tickets on this project."
			flash[:alert].should eql(message)
		end
		it "cannot begin to create a ticket" do 
			get :new, project_id: project.id
			cannot_create_ticket!
		end
		it "cannot create a ticket without permission" do 
			post :create, project_id: project.id
			cannot_create_ticket!
		end
	end
end
