require "rails_helper"

feature 'View a Job Level' do
  scenario "I can see a job level" do

    Skill.create(name:'Junior')

    visit root_path
    click_link "Nivel da vaga"
    click_link "Junior"
      
    expect(page).to have_content('Junior')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end