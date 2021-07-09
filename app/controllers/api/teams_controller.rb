module Api
  class TeamsController < ApplicationController
    before_action :set_team, only: %i[show update destroy]

    def index
      teams = Team.order(created_at: :asc).includes(:results).as_json(
        only: %i[id name founded_year league image],
        include: { results: { only: %i[id team_id year rank wins_count loses_count] } },
      )
      render json: { data: teams }
    end

    def show
      render json: { data: @team }
    end

    def create
      team = Team.new(team_params)

      if team.save
        render json: { data: team }, status: :created
      else
        render json: { errors: team.errors }, status: :unprocessable_entity
      end
    end

    def update
      if @team.update(team_params)
        render json: { data: @team }, status: :created
      else
        render json: { errors: @team.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @team.destroy
        render json: { data: @team }
      else
        render json: { errors: @team.errors }, status: :unprocessable_entity
      end
    end

    private

    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :founded_year)
    end
  end
end
