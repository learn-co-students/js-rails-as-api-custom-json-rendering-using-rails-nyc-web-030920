class BirdsController < ApplicationController
  
  def index
    birds = Bird.all
    render json: birds.to_json(only: [:id, :name, :species])
  end

  def show
    bird = Bird.find_by(id: params[:id])
      if bird
        render json: { id: bird.id, name: bird.name, species: bird.species }
      else #error handling 
        render json: { message: 'Bird not Found' }
      end
  end

end