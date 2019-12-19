require "rails_helper"

feature 'Register new Profile' do
 
  scenario "I can not register a new profile with name empty" do
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')
    login_as(user, scope: :candidate)
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

  
  
end