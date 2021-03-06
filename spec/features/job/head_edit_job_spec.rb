require "rails_helper"

feature 'Headhunter Editing a jobs' do
  scenario "I can edit a job" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    job = Job.create!(title: 'Dev Ruby Jr', description: 'Saber iniciar um Crud', 
               end_date: '2020-01-31', workplace:' Remoto', 
               salary_range: '1000_to_3000', skill: skill, status: "active",
               joblevel: joblevel, company: company, benefit: benefit, user: head)
    
    visit root_path

    login_as(head)

    click_link "Entrar"
  
    click_link "Vagas"
    click_link "Dev Ruby Jr"
    click_link "Editar"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUD e iniciar Testes'
    fill_in 'Encerra', with: '2020-01-15'
    fill_in 'Local de trabalho', with: 'Remoto'
    select '1000 To 3000', from: 'Faixa salarial'
    click_button 'Atualizar Vaga'

    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber inicar um CRUD e iniciar Testes')
    expect(page).to have_content('2020-01-15')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_to_3000')
  end
end