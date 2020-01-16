require "rails_helper"

feature 'Candidate must see a Job and apply' do
  scenario "I can see job and apply " do
    
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')

    job = Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
      end_date: '2020-01-31', workplace:' Remoto', 
      salary_range: '1000_to_3000', skill: skill, status: "active", 
      joblevel: joblevel, company: company, benefit: benefit, user: user)

    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Vagas"
    click_link "Dev Ruby Jr"
    click_link "Aplicar Vaga"
    fill_in "Motivo", with: "Gostei quero participar"
    click_button "Aplicar"
    
    expect(page).to have_content('Dev Ruby Jr')
       
  
  end

  scenario "I can see job" do
    
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')

    job = Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
      end_date: '2020-01-31', workplace:' Remoto', 
      salary_range: '1000_to_3000', skill: skill, status: "active", 
      joblevel: joblevel, company: company, benefit: benefit, user: user)

    
    
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Vagas"
    click_link 'Dev Ruby Jr'
         
    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_link("Aplicar Vaga")
       
  
  end

  scenario "I can see your jobs apply" do
    
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')

    job = Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
      end_date: '2020-01-31', workplace:' Remoto', 
      salary_range: '1000_to_3000', skill: skill, status: "active", 
      joblevel: joblevel, company: company, benefit: benefit, user: user)

    profile = Profile.create!(skill: skill, joblevel: joblevel, user: user, 
      name:'Roberson Miguel', social_name: 'Miguel', 
      address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
      date_birth: '1979-09-20',  languages: "basic English", 
      education_level: 'graduate', education_status: 'concluded', 
      education_institution: 'Senac', education_course: 'Ciências da computação', 
      education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
      experience_reponsibility: 'Gerenciava informatica e financeiro' , 
      experience_role: 'Supervisor de tesouraria', 
      experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
      experience_current_position: false, 
      avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))

    profilejob = Profilejob.create!(profile_id:1, job_id:1, comment:"Gostei e apliquei")

     
    visit root_path

    login_as(user)

    click_link "Entrar"

    click_link "Minhas Vagas"
             
    expect(page).to have_content('Dev Ruby Jr')
           
  
  end
end