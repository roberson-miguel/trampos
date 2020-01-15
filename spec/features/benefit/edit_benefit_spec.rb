require "rails_helper"

feature 'Editing a Benefit' do
  scenario "I can edit a benefit" do

    Benefit.create(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    click_link "Beneficios"
    click_link "Vale transporte"
    click_link "Editar"

    fill_in 'Nome', with: 'VT'
    
    click_button 'Atualizar Beneficio'
    
    expect(page).to have_content('VT')

  end
end