class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # render json: bird.slice(:id, :name, :species) #these two do the same thing
    # render json: birds, only: [:id, :name, :species] #this is the rails way of doing the same thing again
    # render json: birds, except: [:created_at, :updated_at] #this also does the same thing 
    
    #error handling
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
    else
      render json: {message: 'Bird not found'}
    end
  end
end