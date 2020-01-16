require "rails_helper"

feature 'View companies' do
  scenario "must see a company" do
    
    company = Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(head)

    click_link "Entrar"
    
    click_link "Empresas"
    click_link "Campus Code"
   
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('05.372.840/0001-07')
    expect(page).to have_content('Alameda Santos, 011')
    expect(page).to have_content('Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
 
  end
end