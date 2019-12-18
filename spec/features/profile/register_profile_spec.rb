require "rails_helper"

feature 'Create new Profile' do
  scenario "I can create a new profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    visit root_path
    click_link "Perfil Candidato"
    click_link "Novo Perfil"

    fill_in 'Nome', with: 'Roberson'
    select "#{skill.name}", from: 'Habilidades'
    select "#{joblevel.name}", from: 'Nivel Vaga'
    select "#{user.role}", from: 'Função'
    click_button 'Enviar'

    expect(page).to have_content('Roberson')
  

  end

  
end