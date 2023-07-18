class AdoptionAppsController < ApplicationController
  def show
    @adoption_app = AdoptionApp.find(params[:id])
  end

  def new
    # @adoption_app = AdoptionApp.find(params[:id])
  end

  def create
    created = "In Progress"
    new_app = AdoptionApp.new({
      name: params[:name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      description: params[:description],
      pet_names: params[:pet_names],
      status: created
    })

    if new_app.save    
      redirect_to "/adoption_apps/#{new_app.id}"
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end
  
  def search_pets
    @adoption_app = AdoptionApp.find(params[:id])
    search_query = params[:search]
    @adopt_pets = Pet.where("LOWER(name) LIKE ?", "%#{search_query.downcase}%")
  
    render 'show', adopt_pets: @adopt_pets
  end

  def update
    updated_app = AdoptionApp.find(params[:id])
    added_pet = Pet.find(params[:pet_id])
    if updated_app.pet_names == nil
      updated_app.update(pet_names: added_pet.name)
      updated_app.pets << added_pet
      updated_app.save
    end

    redirect_to "/adoption_apps/#{updated_app.id}"
  end

  def submit_application
    submit_app = AdoptionApp.find(params[:id])

    submit_app.update(adoption_app_params.merge(status: "Pending"))
    submit_app.update(description: params[:good_owner_expl])
    submit_app.save

    redirect_to "/adoption_apps/#{submit_app.id}"
  end


  private
  def adoption_app_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end

