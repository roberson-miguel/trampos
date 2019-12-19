require "rails_helper"

feature 'Create new Benefit' do
  scenario "I can create a new benefit" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'Vale transporte'
    click_button 'Enviar'

    expect(page).to have_content('Vale transporte')
    expect(page).to have_content('Beneficio criado com sucesso')

  end

  scenario "I can not create a new benefit empty" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: ' '
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end

  scenario "I can not create a new benefit already in use" do

    Benefit.create(name:'Vale transporte')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'Vale transporte'
    click_button 'Enviar'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new benefit without mininum caracter" do

    Benefit.create(name:'Vale transporte')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    click_link "Beneficios"
    click_link "Novo beneficio"

    fill_in 'Nome', with: 'V'
    click_button 'Enviar'

    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end
end