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
		def cannot_create_tickets!
			response.should redirect_to(project)
			message = "You cannot create tickets on this project."
			flash[:alert].should eql(message)
		end
		def cannot_update_tickets!
			response.should redirect_to(project)
			message = "You cannot edit tickets on this project."
			expect(flash[:alert]).to eql(message)
		end
		def cannot_delete_tickets!
			response.should redirect_to(project)
			message = "You cannot delete tickets on this project."
			expect(flash[:alert]).to eql(message)
		end
		it "cannot begin to create a ticket" do 
			get :new, project_id: project.id
			cannot_create_tickets!
		end
		it "cannot create a ticket without permission" do 
			post :create, project_id: project.id
			cannot_create_tickets!
		end
		it "cannot edit a ticket without permission" do 
			get :edit, project_id: project.id, id: mticket.id
			cannot_update_tickets!
		end
		it "cannot update a ticket without permission" do 
			put :update, project_id: project.id, id: mticket.id, ticket: {}
			cannot_update_tickets!
		end
		it "cannot delete a ticket without permission" do 
			delete :destroy, project_id: project.id, id: mticket.id
			cannot_delete_tickets!
		end
	end
end
