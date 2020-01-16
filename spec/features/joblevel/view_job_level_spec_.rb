require "rails_helper"

feature 'View a Job Level' do
  scenario "I can see a job level" do

    joblevel = Joblevel.create(name:'Junior')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link "Nivel Vaga"
    click_link "Junior"
      
    expect(page).to have_content('Junior')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end