require "rails_helper"

feature 'Register as role a user' do
  scenario "I can create a user as headhunter" do
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    visit root_path
    click_link "Sair"
    click_link "Registrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    select 'Headhunter', from: 'Função'
    fill_in 'Password', with:123123
    fill_in 'Password confirmation', with:123123

    click_button 'Sign up'
    
    #expect(page).to have_content('Your account has been updated successfully.')

  end
end