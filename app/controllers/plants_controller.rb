class PlantsController < ApplicationController
    def index
        plants =  Plant.all
        render json: plants, status: :ok
    end

    def show
        
        plants = Plant.find_by(id:params[:id])

        if plants

            render json: plants, status: :ok

        else
        
            render json: { error: "Plant not found" }, status: :not_found
        end
    end

    def create
        plants = Plant.create(plant_params)
        render json: plants, status: :created
    end

    private
        
    def plant_params
        params.permit(:name, :image, :price)
    end

end
