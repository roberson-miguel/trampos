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

  scenario "I can not create a new benefit empty" do

    visit root_path
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: ' '
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
   
  end

  scenario "I can not create a new benefit empty" do

    Benefit.create(name:'Vale transporte')

    visit root_path
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'Vale transporte'
    click_button 'Enviar'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new benefit without mininum caracter" do

    Benefit.create(name:'Vale transporte')

    visit root_path
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'V'
    click_button 'Enviar'

    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end
end