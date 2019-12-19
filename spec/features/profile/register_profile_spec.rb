require "rails_helper"

feature 'Create new Profile' do
  scenario "I can create a new profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create(email:'elaine@gmail.com', password:123123, role:'candidate')
    
    login_as(user)

    visit root_path
    click_link "Sair"
    click_link "Perfil Candidato"
    click_link "Novo Perfil"

    fill_in 'Nome', with: 'Roberson'
    fill_in 'Nome Social', with: 'Roberson'
    fill_in 'Data Nascimento', with: '1979-09-20'
    fill_in 'Celular', with: '11995705875'
    fill_in 'Endereço', with: '1Rua Rodolfo Mayer, 127 - São Paulo'
    select "#{user.role}", from: 'Tipo de Perfil'

    select "Inglês(Basico)", from: 'Idiomas'

    fill_in 'Instituição', with: 'Senac'
    fill_in 'Curso', with: 'Ciências da computação'
    select 'Graduado', from: 'Nivel Educacional'
    select 'Concluido', from: 'Status do Curso'
    fill_in 'Data conclusão', with: '2018-12-05'

    fill_in 'Experiencia Profissional', with: 'Cia Mineradora Geral'
    fill_in 'Responsabilidades', with: 'Gerenciava informatica e financeiro'
    fill_in 'Cargo', with: 'Supervisor de tesouraria'
    select "#{joblevel.name}", from: 'Nivel Cargo'
    select "#{skill.name}", from: 'Habilidades'
    fill_in 'Data Entrada', with: '1997-12-01'
    fill_in 'Data Saida', with: '2003-03-29'
    #select 'Atual?', from: false

    click_button 'Enviar'

    expect(page).to have_content('Roberson')
  

  end

  scenario "I can not create a new profile with name empty" do
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')
    login_as(user, scope: :headhunter)
    visit root_path
    click_link "Perfil Candidato"
    click_link "Novo Perfil"

    fill_in 'Nome', with: ' '
    fill_in 'Nome Social', with: ' '
    fill_in 'Data Nascimento', with: ' '
    fill_in 'Celular', with: ' '
    fill_in 'Endereço', with: ' '
    select "#{user.role}", from: 'Tipo de Perfil'

    select "Inglês(Basico)", from: 'Idiomas'

    fill_in 'Instituição', with: ' '
    fill_in 'Curso', with: ' '
    select 'Graduado', from: 'Nivel Educacional'
    select 'Concluido', from: 'Status do Curso'
    fill_in 'Data conclusão', with: ' '

    fill_in 'Experiencia Profissional', with: ' '
    fill_in 'Responsabilidades', with: ' '
    fill_in 'Cargo', with: ' '
    select "#{joblevel.name}", from: 'Nivel Cargo'
    select "#{skill.name}", from: 'Habilidades'
    fill_in 'Data Entrada', with: ' '
    fill_in 'Data Saida', with: ' '
    #select 'Atual?', from: false
  
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
    expect(page).to have_content('...deve ter tamanho minimo de 5 caracter')
   
  end

  xscenario "I can not create a new profile with email already in use" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    visit root_path
    click_link "Perfil Candidato"
    click_link "Novo Perfil"

    fill_in 'Nome', with: 'Ruby on Rails'
    click_button 'Enviar'

    expect(page).to have_content('...já está em uso')
   
  end

  
end