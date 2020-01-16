require "rails_helper"

feature 'View a Benefit' do
  scenario "I can see a benefit" do

    benefit = Benefit.create(name:'Vale transporte')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Beneficios"
    click_link "Vale transporte"
      
    expect(page).to have_content('Vale transporte')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end