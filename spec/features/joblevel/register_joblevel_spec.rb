require "rails_helper"

feature 'Create new Jobleevel' do
  scenario "I can create a new joblevel" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'Junior'
    click_button 'Criar Nível da vaga'

    expect(page).to have_content('Junior')
    expect(page).to have_content('Nivel da vaga criado com sucesso')

  end

  scenario "I can not create a new Joblevel empty" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: ' '
    click_button 'Criar Nível da vaga'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end

  scenario "I can not create a new joblevel already in use" do

    joblevel = Joblevel.create(name:'Junior')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'Junior'
    click_button 'Criar Nível da vaga'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new joblevel without mininum caracter" do

    joblevel = Joblevel.create(name:'Junior')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link "Nivel Vaga"
    click_link "Novo nivel vaga"

    fill_in 'Nome', with: 'v'
    click_button 'Criar Nível da vaga'

    expect(page).to have_content('...deve ter tamanho minimo de 2 caracter')
   
  end
end