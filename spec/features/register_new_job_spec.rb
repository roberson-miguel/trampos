require "rails_helper"

feature 'create job' do
  scenario "I can create a job" do

    visit root_path
    click_link "Vagas"
    click_link "Nova vaga"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUD e iniciar TDD'
    click_button 'Enviar'

    expect(page).to have_content('Vaga criada com sucesso.')
  end
end