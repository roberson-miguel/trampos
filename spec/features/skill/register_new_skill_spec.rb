require "rails_helper"

feature 'Create new Skill' do
  scenario "I can create a new skill" do

    visit root_path
    click_link "Habilidades"
    click_link "Nova habilidade"

    fill_in 'Nome', with: 'Ruby on Rails'
    click_button 'Enviar'

    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Habilidade criada com sucesso')

  end
end