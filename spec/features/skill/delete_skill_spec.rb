require "rails_helper"

feature 'Deleting a Skill' do
  scenario "I can delete a skill" do

    skill = Skill.create(name:'Ruby on Rails')

    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(head)

    click_link "Entrar"
   
    click_link "Habilidades"
    click_link "Ruby on Rails"
    click_link "Deletar"

      
    expect(page).to have_content('Habilidade excluida com sucesso')

  end
end