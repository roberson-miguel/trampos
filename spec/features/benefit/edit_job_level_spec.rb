require "rails_helper"

feature 'Editing a Benefit' do
  scenario "I can edit a benefit" do

    Benefit.create(name:'Vale transporte')

    visit root_path
    click_link "Beneficios"
    click_link "Vale transporte"
    click_link "Editar"

    fill_in 'Nome', with: 'VT'
    
    click_button 'Enviar'

    
    expect(page).to have_content('VT')

  end
end