require 'spec_helper'

describe Admin::UsersController do

  let(:user) { FactoryGirl.create(:user) }

  context "standard users" do 

  	before { sign_in(user) }

  	it "cannot access index action" do 
  		get 'index'
  		expect(response).to redirect_to '/'
  		expect(flash[:alert]).to eql("You must be an admin to do that.")
  	end

  end

end
