require "rails_helper"

feature 'delete a jobs' do
  scenario "..I must delete a job" do
    
    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    Job.create(title: 'Dev Ruby', description: 'Saber iniciar um Crud', 
               end_date: '2020-01-31', workplace:' Remoto', 
               salary_range: '1000_até_3000', skill: skill)

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby"
    click_link "Deletar"

    expect(page).to have_content('Vaga excluida com sucesso')
  end
end