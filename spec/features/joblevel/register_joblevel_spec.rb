require "rails_helper"

feature 'Create new Jobleevel' do
  scenario "I can create a new joblevel" do

    visit root_path
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'Junior'
    click_button 'Enviar'

    expect(page).to have_content('Junior')
    expect(page).to have_content('Nivel da vaga criado com sucesso')

  end

  scenario "I can not create a new Joblevel empty" do

    visit root_path
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: ' '
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end

  scenario "I can not create a new joblevel already in use" do

    Joblevel.create(name:'Junior')

    visit root_path
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'Junior'
    click_button 'Enviar'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new joblevel without mininum caracter" do

    Joblevel.create(name:'Junior')

    visit root_path
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'v'
    click_button 'Enviar'

    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end
end