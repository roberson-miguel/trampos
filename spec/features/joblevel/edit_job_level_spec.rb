require "rails_helper"

feature 'Editing a Job Level' do
  scenario "I can edit a job level" do

    Joblevel.create(name:'Junior')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Nivel Vaga"
    click_link "Junior"
    click_link "Editar"

    fill_in 'Nome', with: 'Jr'
    
    click_button 'Atualizar Nível da vaga'

    
    expect(page).to have_content('Jr')

  end
end