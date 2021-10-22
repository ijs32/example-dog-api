class DogsController < ApplicationController
  def create
    dog = Dog.new(
      user_id: current_user.id,
      name: params["name"],
      age: params["age"],
      breed: params["breed"]
    )
    if dog.save
      name = dog.name
      render json: { message: "#{name} successfully added to database"}
    else
      render json: { errors: dog.errors.full_messages }, status: 408
    end
  end
end
