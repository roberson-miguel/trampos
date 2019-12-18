require "rails_helper"

feature 'Register as role a user' do
  scenario "I can create a user as headhunter" do
    
    visit root_path
    click_link "Sair"
    click_link "Registrar"

    fill_in 'Email', with: 'elaine@gmail'
    select 'Headhunter', from: 'Função'
    fill_in 'Password', with:123123
    fill_in 'Password confirmation', with:123123

    click_button 'Sign up'
    
    expect(page).to have_content('Welcome! You have signed up successfully.')

  end
end