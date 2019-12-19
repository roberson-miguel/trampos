require "rails_helper"

feature 'View a Skill' do
  scenario "I can see a skill" do

    Skill.create(name:'Ruby on Rails')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Habilidades"
    click_link "Ruby on Rails"
      
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end