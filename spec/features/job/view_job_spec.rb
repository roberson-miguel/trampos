require "rails_helper"

feature 'View a job' do
  scenario "must de see a job" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    Job.create!(title: 'Dev Ruby', description: 'Saber iniciar um Crud', 
               end_date: '2020-01-31', workplace:' Remoto', 
               salary_range: '1000_até_3000', skill: skill, 
               joblevel: joblevel, company: company, benefit: benefit)

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby Jr"

    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber iniciar um Crud')
    expect(page).to have_content('2020-01-31')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_até_3000')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  end
end