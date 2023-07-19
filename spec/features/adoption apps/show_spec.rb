require "rails_helper"

RSpec.describe "The Adoption Application", type: :feature do
  #user story 1
  describe "#show page" do
    before(:each) do
      test_data
    end
    it "displays an application on the show page" do

      visit "/adoption_apps/#{@adoption_app_1.id}"

      expect(page).to have_content(@adoption_app_1.name)
      expect(page).to have_content(@adoption_app_1.street_address)
      expect(page).to have_content(@adoption_app_1.city)
      expect(page).to have_content(@adoption_app_1.state)
      expect(page).to have_content(@adoption_app_1.zip_code)
      expect(page).to have_content(@adoption_app_1.description)
      expect(@adoption_app_1.pet_names).to be nil
      expect(@adoption_app_1.status).to be nil
    end

    it "Searches for pets" do

      visit "/adoption_apps/#{@adoption_app_1.id}"

      fill_in "Search", with: "Limb"
      click_button "Submit"

      expect(page).to have_content("Limb")
    end

    #user story 5
    it "displays a button called Adopt this Pet that adds the pet to the application" do

      visit "/adoption_apps/#{@adoption_app_2.id}"

      fill_in "Search", with: "Limb"
      click_button "Submit"

      expect(page).to have_content("Limb")
      
      click_button "Adopt this Pet"

      expect(page).to have_content("Pet Names: Limb")
      expect(@adoption_app_2.pets).to eq([@pet_3])
    end

    #user story 6
    it "displays a submit application button once one(or more) pets have been added" do

        visit "/adoption_apps/#{@adoption_app_2.id}"
        fill_in "Search", with: "Limb"
        click_button "Submit"
        click_button "Adopt this Pet"

        fill_in :good_owner_expl, with: "I got some therapy and now I understand the true godliness of animals"
        click_button "Submit Application"

        @adoption_app_2.reload

        expect(@adoption_app_2.status).to eq("Pending")
        expect(page).to_not have_content("Search")
        expect(@adoption_app_2.pet_names).to eq("Limb")
        expect(@adoption_app_2.description).to eq("I got some therapy and now I understand the true godliness of animals")
    end

    #user story 7
    it "will not display the submit application if I have not added any pets yet" do

      visit "/adoption_apps/#{@adoption_app_3.id}"

      expect(page).to_not have_button("Submit Application")

      fill_in "Search", with: "Limb"
      click_button "Submit"
      click_button "Adopt this Pet"
      
        expect(page).to have_button("Submit Application")
      
    end

    #user_story 8 & 9
    it "matches partial and case insensitive searches" do
      visit "/adoption_apps/#{@adoption_app_3.id}"

      fill_in "Search", with: "lIm"
      click_button "Submit"
      
      expect(page).to have_content("Limb")
    end
  end
end