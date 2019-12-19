require "rails_helper"

feature 'Create new Skill' do
  scenario "I can create a new skill" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Habilidades"
    click_link "Nova habilidade"

    fill_in 'Nome', with: 'Ruby on Rails'
    click_button 'Enviar'

    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Habilidade criada com sucesso')

  end

  scenario "I can not create a new skill empty" do

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Habilidades"
    click_link "Nova habilidade"

    fill_in 'Nome', with: ' '
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 3 caracter')
   
  end

  scenario "I can not create a new skill already in use" do

    Skill.create(name:'Ruby on Rails')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Habilidades"
    click_link "Nova habilidade"

    fill_in 'Nome', with: 'Ruby on Rails'
    click_button 'Enviar'

    expect(page).to have_content('...já está em uso')
   
  end

  scenario "I can not create a new skill without mininum caracter" do

    Skill.create(name:'Ruby on Rails')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Habilidades"
    click_link "Nova habilidade"

    fill_in 'Nome', with: 'V'
    click_button 'Enviar'

    expect(page).to have_content('...deve ter tamanho minimo de 3 caracter')
   
  end
end