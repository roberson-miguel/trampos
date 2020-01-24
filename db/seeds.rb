# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Benefit.destroy_all
Company.destroy_all
Skill.destroy_all
Job.destroy_all
Profile.destroy_all
Profilejob.destroy_all

user = User.create!(email:'candidate@candidate', password:123123, role:'candidate', status:'andamento')
head = User.create!(email:'headhunter@headhunter', password:123123, role:'headhunter', status:'andamento')
benefit = Benefit.create!(name:'Vale transporte')
skill = Skill.create!(name:'Ruby on Rails')
joblevel = Joblevel.create!(name:'Junior')
company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', 
                address: 'Alameda Santos, 011', 
                description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
company1 = Company.create!(name: 'Bios Bug', cnpj: '04.456.878/0001-56', 
                address: 'Rua Tito, 011', 
                description: 'SoftHouse e Consultoria Ltda')
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

job = Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
            end_date: '2020-01-31', workplace:' Remoto', 
            salary_range: '1000_to_3000', skill: skill, status: "active", 
            joblevel: joblevel, company: company, benefit: benefit, user: head)


 
profilejob = Profilejob.create!(profile_id: profile.id, job_id: job.id, comment:"Gostei e apliquei")
