require "rails_helper"

feature 'View a Skill' do
  scenario "I can see a skill" do

    skill = Skill.create(name:'Ruby on Rails')

    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(head)

    click_link "Entrar"
   
    click_link "Habilidades"
    click_link "Ruby on Rails"
      
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end