require "rails_helper"

feature 'Headhunter delete a jobs' do
  scenario "..I must delete a job" do
    
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter', status:'andamento')

    Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
      end_date: '2020-01-31', workplace:' Remoto', 
      salary_range: '1000_to_3000', skill: skill, status: "active", 
      joblevel: joblevel, company: company, benefit: benefit, user: user)
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Vagas"
    click_link "Dev Ruby Jr"
    click_link "Deletar"

    expect(page).to have_content('Vaga excluida com sucesso')
  end
end