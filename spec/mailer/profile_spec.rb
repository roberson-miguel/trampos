require 'rails_helper'

RSpec.describe ProfilesMailer, type: :mailer do
  describe '#confirm' do
    it 'should send to customer email' do
        skill = Skill.create!(name:'Ruby on Rails')
        joblevel = Joblevel.create!(name:'Junior')
        head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:'andamento')
        profile = Profile.create!(skill: skill, joblevel: joblevel, user: head,
                        name:'Roberson', social_name: 'Roberson Miguel', 
                        address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                        date_birth: '1979-09-20',  languages: "basic English", 
                        education_level: 'graduate', education_status: 'concluded', 
                        education_institution: 'Senac', education_course: 'Ciências da computação', 
                        education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                        experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                        experience_role: 'Supervisor de tesouraria', 
                        experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                        experience_current_position: false, email: 'roberson@gmail.com',
                        avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))

      mail = ProfilesMailer.welcome(profile.id)

      expect(mail.to).to include(profile.email)
    end

    it 'should send from default email' do
        skill = Skill.create!(name:'Ruby on Rails')
        joblevel = Joblevel.create!(name:'Junior')
        head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:'andamento')
        profile = Profile.create!(skill: skill, joblevel: joblevel, user: head,
                        name:'Roberson', social_name: 'Roberson Miguel', 
                        address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                        date_birth: '1979-09-20',  languages: "basic English", 
                        education_level: 'graduate', education_status: 'concluded', 
                        education_institution: 'Senac', education_course: 'Ciências da computação', 
                        education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                        experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                        experience_role: 'Supervisor de tesouraria', 
                        experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                        experience_current_position: false, email: 'roberson@gmail.com',
                        avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))
      
      mail = ProfilesMailer.welcome(profile.id)

      expect(mail.from).to include('from@example.com')

    end

    it 'should have default subject' do
        skill = Skill.create!(name:'Ruby on Rails')
        joblevel = Joblevel.create!(name:'Junior')
        head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:'andamento')
        profile = Profile.create!(skill: skill, joblevel: joblevel, user: head,
                        name:'Roberson', social_name: 'Roberson Miguel', 
                        address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                        date_birth: '1979-09-20',  languages: "basic English", 
                        education_level: 'graduate', education_status: 'concluded', 
                        education_institution: 'Senac', education_course: 'Ciências da computação', 
                        education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                        experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                        experience_role: 'Supervisor de tesouraria', 
                        experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                        experience_current_position: false, email: 'roberson@gmail.com',
                        avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))
      
      mail = ProfilesMailer.welcome(profile.id)

      
      expect(mail.subject).to include('Successful registration')
    end

    it 'should have default body' do
        skill = Skill.create!(name:'Ruby on Rails')
        joblevel = Joblevel.create!(name:'Junior')
        head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:'andamento')
        profile = Profile.create!(skill: skill, joblevel: joblevel, user: head,
                        name:'Roberson', social_name: 'Roberson Miguel', 
                        address: 'Rua Rodolfo Mayer, 127 - São Paulo', cellphone: '11995705875',
                        date_birth: '1979-09-20',  languages: "basic English", 
                        education_level: 'graduate', education_status: 'concluded', 
                        education_institution: 'Senac', education_course: 'Ciências da computação', 
                        education_end_date: '2018-12-05', experience_company: 'Cia Mineradora Geral', 
                        experience_reponsibility: 'Gerenciava informatica e financeiro' , 
                        experience_role: 'Supervisor de tesouraria', 
                        experience_start_date: '1997-12-01', experience_end_date: '2003-03-29', 
                        experience_current_position: false, email: 'roberson@gmail.com',
                        avatar:Rails.root.join('spec', 'support', 'perfil_red.jpg'))
      
      
      
      mail = ProfilesMailer.welcome(profile.id)

      expect(mail.body).to include('Thanks for joining and have a great day!')
    end
  end
end