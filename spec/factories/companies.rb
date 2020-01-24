FactoryBot.define do
    factory :company do
      name { Faker::Company.name }
      #name {'Campus Code'}
      #cnpj {'05.372.840/0001-07'}
      sequence(:cnpj) { |n| "05.#{n}72.840/0001-0#{n}" }
      address {'Alameda Santos, 1293'}
      description {'Consultoria e Desenvolvimento de Software'}
    end
end