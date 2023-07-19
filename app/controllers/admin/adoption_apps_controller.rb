class Admin::AdoptionAppsController < ApplicationController

  def show
    @adoption_app = AdoptionApp.find(params[:id])
  end

  def approve_pet
    adoption_app_pet = AdoptionAppPet.find(params[:id])
    adoption_app_pet.update(status: :approved)
    redirect_to "/admin/applications/#{adoption_app_pet.adoption_app.id}"
  end

  def reject_pet
    adoption_app_pet = AdoptionAppPet.find(params[:id])
    adoption_app_pet.update(status: :rejected)
    redirect_to "/admin/applications/#{adoption_app_pet.adoption_app.id}"
  end

  private
  def admin_app_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end