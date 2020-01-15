require "rails_helper"

feature 'Editing a company' do
  scenario "...I can edit a company" do
    
    Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Empresas"
    click_link "Campus Code"
    click_link "Editar"

    fill_in 'Nome', with: 'Campus Code'
    fill_in 'CNPJ', with: '05.372.840'
    fill_in 'Endereço', with: 'Alameda Santos, 011'
    fill_in 'Descrição', with: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails'
    click_button 'Atualizar Empresa'
   
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('05.372.840')
    expect(page).to have_content('Alameda Santos, 011')
    expect(page).to have_content('Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

  end
end