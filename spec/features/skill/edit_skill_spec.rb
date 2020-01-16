require "rails_helper"

feature 'Editing a Skill' do
  scenario "I can edit a skill" do

    skill = Skill.create(name:'Ruby on Rails')

    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(head)

    click_link "Entrar"
    
    click_link "Habilidades"
    click_link "Ruby on Rails"
    click_link "Editar"

    fill_in 'Nome', with: 'Python'
    
    click_button 'Atualizar Habilidade'

    
    expect(page).to have_content('Python')

  end
end