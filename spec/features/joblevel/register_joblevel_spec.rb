require "rails_helper"

feature 'Create new Job Level' do
  scenario "I can create a new job level" do

    visit root_path
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'Junior'
    click_button 'Enviar'

    expect(page).to have_content('Junior')
    expect(page).to have_content('Nivel da vaga criado com sucesso')

  end
end