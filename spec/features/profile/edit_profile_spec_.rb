require "rails_helper"

feature 'Editing a Profile' do
  scenario "I can edit a profile" do

    Profile.create(name:'Roberson')

    visit root_path
    click_link "Perfil Candidato"
    click_link "Roberson"
    click_link "Editar"

    fill_in 'Nome', with: 'Roberson Miguel'

      
    expect(page).to have_content('Roberson Miguel')

  end
end