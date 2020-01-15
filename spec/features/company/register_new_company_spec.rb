require "rails_helper"

feature 'Create new Company' do
  scenario "I can create a new company" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Empresas"
    click_link "Nova empresa"

    fill_in 'Nome', with: 'Campus Code'
    fill_in 'CNPJ', with: '05.372.840/0001-07'
    fill_in 'Endereço', with: 'Alameda Santos, 011'
    fill_in 'Descrição', with: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails'
    
    click_button 'Criar Empresa'

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('05.372.840/0001-07')
    expect(page).to have_content('Alameda Santos, 011')
    expect(page).to have_content('Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    expect(page).to have_content('Empresa criada com sucesso.')

  end

  scenario "I can not create a new company empty" do

     user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Empresas"
    click_link "Nova empresa"

    fill_in 'Nome', with: ' '
    click_button 'Criar Empresa'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 20 caracter')
   
  end

  scenario "I can not create a new company already in use" do

    Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

     user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Empresas"
    click_link "Nova empresa"

    fill_in 'Nome', with: 'Campus Code'
    fill_in 'CNPJ', with: '05.372.840/0001-07'
    fill_in 'Endereço', with: 'Alameda Santos, 011'
    fill_in 'Descrição', with: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails'
    click_button 'Criar Empresa'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new joblevel without mininum caracter in description" do

    Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

     user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Empresas"
    click_link "Nova empresa"

    fill_in 'Nome', with: 'Campus Code'
    fill_in 'CNPJ', with: '05.372.840/0001-07'
    fill_in 'Endereço', with: 'Alameda Santos, 011'
    fill_in 'Descrição', with: 'Consultoria'
    click_button 'Criar Empresa'

    expect(page).to have_content('...deve ter tamanho minimo de 20 caracter')
   
  end

end