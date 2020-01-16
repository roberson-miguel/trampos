require "rails_helper"

  feature "opening home page" do
    it "must access root_path" do

      user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
      
      visit root_path

      login_as(user)

      click_link "Entrar"

      expect(page).to have_link('Vagas')
    end
  end