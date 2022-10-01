class CheesesController < ApplicationController

  # GET /cheeses
  # Removing Content When Rendering
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]
  end

  # def index
  #   cheeses = Cheese.all
  #   render json: cheeses, except: [:created_at, :updated_at]
  # end

  # GET /cheeses/:id
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: {
  #     id: cheese.id,
  #     name: cheese.name,
  #     price: cheese.price,
  #     is_best_seller: cheese.is_best_seller
  #   }
  # end


  #  Extending JSON Data with :methods
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: cheese, only: [:id, :name, :price, :is_best_seller], methods: [:summary]
  # end

  # Basic Error Messaging When Rendering JSON Data
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: "Cheese not found" }, status: :not_found
    end
  end

end
