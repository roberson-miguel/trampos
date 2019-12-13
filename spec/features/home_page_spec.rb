require "rails_helper"

  feature "opening home page" do
    it "must access root_path" do
      visit root_path

      expect(page).to have_link('Vagas')
    end
  end