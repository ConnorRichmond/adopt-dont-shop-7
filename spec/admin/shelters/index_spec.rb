require "rails_helper"

RSpec.describe "visiting the admin shelter index", type: :feature do 
  before(:each) do
    test_data
  end
  #user story 10
  it "will list all shelters in reverse alpha order by name" do
    visit "/admin/shelters"

    expect(@shelter_2.name).to appear_before(@shelter_1.name)

    expect(page).to have_content("RGV animal shelter")
  end

  #user story 11
  it "will display a list on Shelters with pending applications" do
    visit "/adoption_apps/#{@adoption_app_2.id}"
    
    fill_in "Search", with: "Limb"
    click_button "Submit"
    click_button "Adopt this Pet"
    
    fill_in :good_owner_expl, with: "I got some therapy and now I understand the true godliness of animals"
    click_button "Submit Application"
    
    @adoption_app_2.reload

    visit "/admin/shelters"

    within(".Pending_apps") do
      expect(page).to have_content("Shelters with Pending Applications")
      expect(@adoption_app_2.status).to eq("Pending")
      expect(page).to have_content("Fancy pets of Colorado")
    end

  end
end