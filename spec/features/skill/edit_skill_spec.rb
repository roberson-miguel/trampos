require "rails_helper"

feature 'Editing a Skill' do
  scenario "I can edit a skill" do

    Skill.create(name:'Ruby on Rails')

    visit root_path
    click_link "Habilidades"
    click_link "Ruby on Rails"
    click_link "Editar"

    fill_in 'Nome', with: 'Python'
    
    click_button 'Enviar'

    
    expect(page).to have_content('Python')

  end
end