require "rails_helper"

feature 'Create a new Job' do
  scenario "I can create a new job" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    

    visit root_path
    click_link "Vagas"
    click_link "Nova vaga"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUD e iniciar TDD'
    fill_in 'Encerra', with: '2020-01-15'
    fill_in 'Local de trabalho', with: 'Remoto'
    select '1000 Até 3000', from: 'Faixa salarial'
    select "#{skill.name}", from: 'Habilidades'
    click_button 'Enviar'

    expect(page).to have_content('Vaga criada com sucesso.')
    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber inicar um CRUD e iniciar TDD')
    expect(page).to have_content('2020-01-15')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_até_3000')
    expect(page).to have_content('Ruby on Rails')
  end
end