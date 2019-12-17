require "rails_helper"

feature 'Deleting a Job Level' do
  scenario "I can delete a job level" do

    Skill.create(name:'Junior')

    visit root_path
    click_link "Nivel da vaga"
    click_link "Junior"
    click_link "Deletar"

      
    expect(page).to have_content('Nivel da vaga excluido com sucesso')

  end
end