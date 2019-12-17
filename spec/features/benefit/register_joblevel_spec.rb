require "rails_helper"

feature 'Create new Benefit' do
  scenario "I can create a new benefit" do

    visit root_path
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'Vale transporte'
    click_button 'Enviar'

    expect(page).to have_content('Vale transporte')
    expect(page).to have_content('Beneficio criado com sucesso')

  end
end