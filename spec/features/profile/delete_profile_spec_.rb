require "rails_helper"

feature 'Deleting a Profile' do
  scenario "I can delete a profile" do

    Profile.create(name:'Roberson')

    visit root_path
    click_link "Perfil Candidato"
    click_link "Roberson"
    click_link "Deletar"

      
    expect(page).to have_content('Perfil excluido com sucesso')

  end
end