class TeamsController < ApplicationController
	
	def new
	end
	
	def index
		@teams = Team.order('id ASC').all
	end
	
	# Import a list of teams from the score system
	def import
	end
	
	def upload
		@team_list = params.require(:file)
		Team.import(@team_list)
		render 'index'
	end
	
	def create
		render plain: params[:teams].inspect
	end
	
	def edit
		@team = Team.find(params[:id])
	end
	
	def show
		@team = Team.find(params[:id])
	end
	
	def update
		@team = Team.find(params[:id])
		
		if @team.update(team_params)
			redirect_to @team
		else
			render 'edit'
		end
	end
	
	def destroy
	end

	private
	
	def team_params
		params.require(:team).permit(:description, :logo, :picture)
	end
end
