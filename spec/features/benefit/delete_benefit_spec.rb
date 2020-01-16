require "rails_helper"

feature 'Deleting a Benefit' do
  scenario "I can delete a benefit" do

    benefit = Benefit.create(name:'Vale transporte')
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Beneficios"
    click_link "Vale transporte"
    click_link "Deletar"

      
    expect(page).to have_content('Beneficio excluido com sucesso')

  end
end