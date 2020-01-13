require "rails_helper"

feature 'Deleting a Profile' do
  scenario "I can delete a profile" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'candidate', status:'andamento')
  

    Profile.create!(skill: skill, joblevel: joblevel, user: user,
                    name:'Roberson Miguel', social_name: 'Roberson Miguel', 
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

    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Completar Perfil"
 
    click_link "Deletar"

      
    expect(page).to have_content('Perfil excluido com sucesso')

  end
end