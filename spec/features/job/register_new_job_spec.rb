require "rails_helper"

feature 'Create a new Job' do
  scenario "I can create a new job" do

    visit root_path
    click_link "Vagas"
    click_link "Nova vaga"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUD e iniciar TDD'
    fill_in 'Encerra', with: '2020-01-15'
    fill_in 'Local de trabalho', with: 'Remoto'
    select '1000 Até 3000', from: 'Faixa salarial'
    click_button 'Enviar'

    expect(page).to have_content('Vaga criada com sucesso.')
    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber inicar um CRUD e iniciar TDD')
    expect(page).to have_content('2020-01-15')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_até_3000')
  end
end