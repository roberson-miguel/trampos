require "rails_helper"

feature 'Editing a Profile' do
  scenario "I can edit a profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')

    login_as(user, scope: :candidate)

    Profile.create!(skill: skill, joblevel: joblevel, user: user, 
                    name:'Roberson Miguel', social_name: 'Miguel', 
                    address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                    date_birth: '10/09/1979',  languages: "basic English", 
                    education_level: 'graduate', education_status: 'concluded', 
                    education_institution: 'Senac', education_course: 'Ciências da computação', 
                    education_end_date: '05/12/2018', experience_company: 'Cia Mineradora Geral', 
                    experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                    experience_role: 'Supervisor de tesouraria', 
                    experience_start_date: '01/12/1997', experience_end_date: '29/03/2003', 
                    experience_current_position: false, 
                    avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Completar Perfil"
      
    attach_file('Foto', Rails.root.join('spec', 'support', 'perfil_red.jpg'))
    fill_in 'Nome', with: 'Roberson'
    fill_in 'Nome Social', with: 'Bios' 
    
    select '20', :from => 'profile_date_birth_3i'
    select 'setembro', :from => 'profile_date_birth_2i'
    select '1979', :from => 'profile_date_birth_1i'
  
    fill_in 'Celular', with: '11995705875'
    fill_in 'Endereço', with: 'Rua Rodolfo Mayer, 127 - São Paulo'
    select "candidate", from: 'Tipo de Perfil'

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
    select '1997', :from => 'profile_experience_start_date_1i'
    
    select '29', :from => 'profile_experience_end_date_3i'
    select 'março', :from => 'profile_experience_end_date_2i'
    select '2003', :from => 'profile_experience_end_date_1i'
    uncheck 'Atual?' 

    click_button 'Atualizar Perfil'

    
    expect(page).to have_content('Roberson')

  end
end

