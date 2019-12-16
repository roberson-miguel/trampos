require "rails_helper"

feature 'Deleting a Skill' do
  scenario "I can delete a skill" do

    Skill.create(name:'Ruby on Rails')

    visit root_path
    click_link "Habilidades"
    click_link "Ruby on Rails"
    click_link "Deletar"

      
    expect(page).to have_content('Habilidade excluida com sucesso')

  end
end