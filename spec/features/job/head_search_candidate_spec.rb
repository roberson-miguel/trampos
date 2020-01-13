require "rails_helper"

feature 'Headhunter Search by candidate' do
  scenario "I can searching a candidate" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:"andamento")
    Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
               end_date: '2020-01-31', workplace:' Remoto', 
               salary_range: '1000_to_3000', skill: skill, status: "active",
               joblevel: joblevel, company: company, benefit: benefit, user: user)
    Profile.create!(skill: skill, joblevel: joblevel, user: user, 
                name:'Roberson Miguel', social_name: 'Miguel', 
                address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                date_birth: '1979-09-20',  languages: "basic English", 
                education_level: 'graduado', education_status: 'concluido', 
                education_institution: 'Senac', education_course: 'Ciências da computação', 
                education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                experience_role: 'Supervisor de tesouraria', 
                experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                experience_current_position: false, 
                avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))

    
    

    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
  
    click_link "Pesquisar Candidato"
    fill_in "q", with:'Informatica'
    click_button "Buscar"

  
    expect(page).to have_content('Roberson Miguel')
    
  end
end