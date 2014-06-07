class MticketsController < ApplicationController
	before_action :set_project
	before_action :set_mticket, only: [:show, :edit, :update, :destroy]
	before_action :require_signin!, except: [:show, :index]
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
			params.require(:mticket).permit(:title, :description)
		end
		
		def set_project
			@project = Project.find(params[:project_id])
		end

		def set_mticket
			@mticket = @project.mtickets.find(params[:id])
		end
end
