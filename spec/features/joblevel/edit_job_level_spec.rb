require "rails_helper"

feature 'Editing a Job Level' do
  scenario "I can edit a job level" do

    Joblevel.create(name:'Junior')

    visit root_path
    click_link "Nivel Vaga"
    click_link "Junior"
    click_link "Editar"

    fill_in 'Nome', with: 'Jr'
    
    click_button 'Enviar'

    
    expect(page).to have_content('Jr')

  end
end