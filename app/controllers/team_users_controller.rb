class TeamUsersController < ApplicationController
  def create
    team_user = TeamUser.new(team_user_params)

    if team_user.save
      flash[:notice] = "Successfully joined team!"
    else
      flash[:alert] = "Uh oh! Something went wrong. Please try again or contact us for support!"
    end
    redirect_to team_path(params[:team_user][:team_id])
  end

  def destroy
    team_user = TeamUser.find_by(user_id: params[:user_id], team_id: params[:team_id])
    team_user.destroy
    redirect_to team_path(params[:team_id]), notice: 'Successfully left team.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_user_params
      params.require(:team_user).permit(:user_id, :team_id)
    end
end
