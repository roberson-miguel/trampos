require "rails_helper"

feature 'View a Skill' do
  scenario "I can see a skill" do

    Skill.create(name:'Ruby on Rails')

    visit root_path
    click_link "Habilidades"
    click_link "Ruby on Rails"
      
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end