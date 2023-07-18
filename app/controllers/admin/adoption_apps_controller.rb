class Admin::AdoptionAppsController < ApplicationController
  def show
    @adoption_app = AdoptionApp.find(params[:id])
  end

  def approve
    admin_app = AdoptionApp.find(params[:id])
    admin_app.update(admin_app_params.merge(status: "Approved"))
    admin_app.save
    end

    private
    def admin_app_params
      params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
    end
end