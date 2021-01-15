class AttractionsController < ApplicationController

    def index
    end

    def new 
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to @attraction   
        else
            render 'new'       
        end  
    end

    def edit
        @attraction = Attraction.all.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.all.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        @attraction = Attraction.all.find_by(id: params[:id])
    end

    private
 
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end