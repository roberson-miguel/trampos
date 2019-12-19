require "rails_helper"

feature 'Editing a Profile' do
  scenario "I can edit a profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate')

    login_as(user, scope: :candidate)

    Profile.create!(skill: skill, joblevel: joblevel, user: user, email: user, 
                    name:'Roberson', social_name: 'Roberson Miguel', 
                    address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                    date_birth: '1979-09-20',  languages: "inglês(basico)", 
                    education_level: 'graduado', education_status: 'concluido', 
                    education_institution: 'Senac', education_course: 'Ciências da computação', 
                    education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                    experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                    experience_role: 'Supervisor de tesouraria', 
                    experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                    experience_current_position: false )
    
    

    visit root_path
    click_link "Perfil Candidato"
    click_link "Roberson"
    click_link "Editar"

    expect(page).to have_content(current_user.email)

    fill_in 'Nome', with: 'Roberson'
    fill_in 'Nome Social', with: 'Roberson'
    fill_in 'Data Nascimento', with: '1979-09-20'
    fill_in 'Celular', with: '11995705875'
    fill_in 'Endereço', with: 'Rua Rodolfo Mayer, 127 - São Paulo'
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
end
