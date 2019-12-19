require "rails_helper"

feature 'Deleting a Skill' do
  scenario "I can delete a skill" do

    Skill.create(name:'Ruby on Rails')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
    
    click_link "Habilidades"
    click_link "Ruby on Rails"
    click_link "Deletar"

      
    expect(page).to have_content('Habilidade excluida com sucesso')

  end
end