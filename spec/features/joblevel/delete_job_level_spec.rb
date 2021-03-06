require "rails_helper"

feature 'Deleting a Job Level' do
  scenario "I can delete a job level" do

    joblevel = Joblevel.create(name:'Junior')

    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link "Nivel Vaga"
    click_link "Junior"
    click_link "Deletar"

      
    expect(page).to have_content('Nivel da vaga excluido com sucesso')

  end
end