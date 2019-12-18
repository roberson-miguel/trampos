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
    select "#{user.role}", from: 'Tipo de Perfil'

    select "Inglês(Basico)", from: 'Idiomas'

    select 'Graduado', from: 'Nivel Educacional'
    select 'Concluido', from: 'Status do Curso'
    fill_in 'Instituição', with: 'Senac'
    fill_in 'Curso', with: 'Ciências da computação'
    fill_in 'Data conclusão', with: '2018-12-05'

    fill_in 'Experiencia Profissional', with: 'Cia Mineradora Geral'
    fill_in 'Responsabilidades', with: 'Gerenciava informatica e financeiro'
    fill_in 'Cargo', with: 'Supervisor de tesouraria'
    select "#{joblevel.name}", from: 'Nivel Cargo'
    select "#{skill.name}", from: 'Habilidades'
    fill_in 'Data Entrada', with: '1997-12-01'
    fill_in 'Data Saida', with: '2003-03-29'
    select 'Atual?', from: :false

    click_button 'Enviar'

    expect(page).to have_content('Roberson')
  

  end

  
end