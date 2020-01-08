require "rails_helper"

  feature "opening home page" do
    it "must access root_path" do

      user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
      
      visit root_path
      click_link "Entrar"


      fill_in 'Email', with: 'elaine@gmail.com'
      fill_in 'Password', with:123123
      click_button 'Log in'

      expect(page).to have_link('Vagas')
    end
  end