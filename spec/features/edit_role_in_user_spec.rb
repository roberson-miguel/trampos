require "rails_helper"

feature 'Edit Role in user/edit' do
  scenario "I can edit the role in user" do
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')
    
    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link 'Editar Conta'
    
    select 'Headhunter', from: 'Função'
    fill_in 'Current password', with:123123
    select 'Novoperfil', from: 'Status'
    click_button 'Atualizar Usuário'

    expect(page).to have_content('Sua conta foi atualizada com sucesso.')

  end
end