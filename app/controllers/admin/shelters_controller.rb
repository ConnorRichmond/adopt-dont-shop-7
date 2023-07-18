class Admin::SheltersController < ApplicationController
  def index
    @adoption_apps = AdoptionApp.all
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name DESC")
  end
end