require "rails_helper"

feature 'View a Profile' do
  scenario "I can see a profile" do

    Profile.create(name:'Roberson')

    visit root_path
    click_link "Perfil Candidato"
    click_link "Roberson"
      
    expect(page).to have_content('Roberson')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end