require "rails_helper"

feature 'Edit Role in user/edit' do
  scenario "I can edit the role in user" do
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    visit root_path
    click_link "Sair"
    click_link "Editar Perfil"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    select 'Headhunter', from: 'Função'
    fill_in 'Current password', with:123123
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')

  end
end