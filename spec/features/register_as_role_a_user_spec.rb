require "rails_helper"

feature 'Register as role a user' do
  scenario "I can create a user as headhunter" do
    
    visit root_path
    
    click_link "Registrar conta"

    fill_in 'Email', with: 'elaine@gmail'
    select 'Headhunter', from: 'Função'
    fill_in 'Senha', with:123123
    fill_in 'Confirme a senha', with:123123

    click_button 'Criar Usuário'
    
    expect(page).to have_content('Bem-vindo! Você se registrou com êxito.')

  end
end