require "rails_helper"

feature 'create jobs' do
  scenario "I can jobs" do

    Job.create(title:"Dev Ruby Jr", description:"Saber iniciar um Crud")

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby Jr"
    click_link "Editar"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUB e iniciar Testes'
    click_button 'Enviar'

    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber inicar um CRUB e iniciar Testes')
  end
end