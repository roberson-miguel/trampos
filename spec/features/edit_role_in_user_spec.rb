require "rails_helper"

feature 'Edit Role in user/edit' do
  scenario "I can edit the role in user" do
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')
    
  
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link 'Editar Conta'
    
    select 'Headhunter', from: 'Função'
    fill_in 'Current password', with:123123
    select 'Novoperfil', from: 'Status'
    click_button 'Update'

    expect(page).to have_content('Sua conta foi atualizada com sucesso.')

  end
end