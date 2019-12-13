require "rails_helper"

feature 'create jobs' do
  scenario "I can jobs" do

    visit root_path
    click_link "Vagas"
    click_link 'Nova Vaga'

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUB e iniciar TDD'
    click_button 'Criar produto'

    expect(page).to have_content('Vaga criada com sucesso.')
  end
end