require "rails_helper"

RSpec.describe "admin applications/id page", type: :feature do
  before(:each) do
    test_data
  end
  describe "admin applications show page" do
    it "displays a button to approve application for a specific pet" do

      visit "/adoption_apps/#{AdoptionApp.all.last.id}"
    
      fill_in "Search", with: "Limb"
      click_button "Submit"
      click_button "Adopt this Pet"
      
      fill_in :good_owner_expl, with: "I got some therapy and now I understand the true godliness of animals"
      
      click_button "Submit Application"
      
      @adoption_app_1.reload
      
      visit "/admin/applications/#{AdoptionApp.all.last.id}"

      expect(page).to have_button("Approve")

      click_button "Approve"

      @adoption_app_1.reload

      expect(page).to_not have_button("Approve")
      expect(page).to have_content("Approved!")
    end

    it "can reject a pet for a specific application" do
      visit "/adoption_apps/#{AdoptionApp.all.last.id}"
    
      fill_in "Search", with: "Limb"
      click_button "Submit"
      click_button "Adopt this Pet"
      
      fill_in :good_owner_expl, with: "I eat cats and honestly I am a terrible person"
      
      click_button "Submit Application"
      
      @adoption_app_1.reload
      
      visit "/admin/applications/#{AdoptionApp.all.last.id}"

      expect(page).to have_button("Reject")

      click_button "Reject"

      @adoption_app_1.reload

      expect(page).to_not have_button("Approve")
      expect(page).to_not have_button("Reject")
      expect(page).to have_content("REJECTED!")
    end
  end
end