class MticketsController < ApplicationController
	before_action :require_signin!
	before_action :set_project
	before_action :set_mticket, only: [:show, :edit, :update, :destroy]	
	before_action :authorize_create!, only: [:new, :create]
	before_action :authorize_update!, only: [:edit, :update]
	before_action :authorize_delete!, only: [:destroy]
	def new
		@mticket = @project.mtickets.build
	end

	def create
		@mticket = @project.mtickets.build(mticket_params)
		@mticket.user = current_user
		if @mticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @mticket]
		else
			flash[:alert] = "Ticket has not been created."
			render "new"
		end
	end

	def edit
	end

	def update
		if @mticket.update(mticket_params)
			flash[:notice] = "Ticket has been updated."
			redirect_to [@project, @mticket]
		else
			flash[:alert] = "Ticket has not been updated."
			render action: "edit"
		end
	end

	def destroy
		@mticket.destroy
		flash[:notice] = "Ticket has been deleted."
		redirect_to @project
	end
	private
		def mticket_params
			params.require(:mticket).permit(:title, :description, :asset)
		end
		
		def set_project
			@project = Project.for(current_user).find(params[:project_id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The project you were looking for could not be found."
			redirect_to root_path
		end

		def set_mticket
			@mticket = @project.mtickets.find(params[:id])
		end
		def authorize_create!
			if !current_user.admin? && cannot?("create tickets".to_sym, @project)
				flash[:alert] = "You cannot create tickets on this project."
				redirect_to @project
			end
		end
		def authorize_update!
			if !current_user.admin? && cannot?("edit tickets".to_sym, @project)
				flash[:alert] = "You cannot edit tickets on this project."
				redirect_to @project
			end
		end
		def authorize_delete!
			if !current_user.admin? && cannot?("delete tickets".to_sym, @project)
				flash[:alert] = "You cannot delete tickets on this project."
				redirect_to @project
			end
		end
end
