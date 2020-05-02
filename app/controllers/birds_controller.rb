class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species]
  end

  def show
    # find_by returns nil if bird is not found
    bird = Bird.find_by(id: params[:id])

    if bird #if truthy (bird is found by id value)
      # render json: {id: bird.id, name: bird.name, species: bird.species}
      # render json: bird.slice(:id, :name, :species)
      render json: bird, only: [:id, :name, :species]
    else #error handling
      render json: {message: 'Bird not found'}
    end
  end
end