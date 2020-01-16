require "rails_helper"

feature 'Register new Profile' do
  scenario "I can register a new profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    visit root_path

    login_as(user)

    click_link "Entrar"
    
    click_link "Novo Perfil"

    attach_file('Foto', Rails.root.join('spec', 'support', 'perfil_red.jpg'))
    fill_in 'Nome', with: 'Roberson'
    fill_in 'Nome Social', with: 'Roberson Miguel'
  
    select '20', :from => 'profile_date_birth_3i'
    select 'setembro', :from => 'profile_date_birth_2i'
    select '1979', :from => 'profile_date_birth_1i'

    fill_in 'Celular', with: '11995705875'
    fill_in 'Endereço', with: '1Rua Rodolfo Mayer, 127 - São Paulo'
    select "#{user.role}", from: 'Tipo de Perfil'

    select "Basic English", from: 'Idiomas'

    fill_in 'Instituição', with: 'Senac'
    fill_in 'Curso', with: 'Ciências da computação'
    select 'Graduate', from: 'Nivel Educacional'
    select 'Concluded', from: 'Status do Curso'

    select '5', :from => 'profile_education_end_date_3i'
    select 'dezembro', :from => 'profile_education_end_date_2i'
    select '2018', :from => 'profile_education_end_date_1i'

    fill_in 'Empresa', with: 'Cia Mineradora Geral'
    fill_in 'Responsabilidades', with: 'Gerenciava informatica e financeiro'
    fill_in 'Cargo', with: 'Supervisor de tesouraria'
    select "#{joblevel.name}", from: 'Nivel Cargo'
    select "#{skill.name}", from: 'Habilidades'
    
    select '1', :from => 'profile_experience_start_date_3i'
    select 'dezembro', :from => 'profile_experience_start_date_2i'
    select '2015', :from => 'profile_experience_start_date_1i'

    select '29', :from => 'profile_experience_end_date_3i'
    select 'março', :from => 'profile_experience_end_date_2i'
    select '2020', :from => 'profile_experience_end_date_1i'
    

    click_button 'Criar Perfil'

    expect(page).to have_content('Roberson')
  

  end
    
  
end