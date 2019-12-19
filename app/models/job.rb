class Job < ApplicationRecord
    belongs_to :company
    belongs_to :benefit
    belongs_to :skill
    belongs_to :joblevel
    belongs_to :user
    

    validates :title, :description, :workplace, :end_date, :salary_range, presence: {message: '...deve ser informado'}
    
    enum salary_range: { "1000_até_3000": 0, "3001_até_5000": 15, "5001_até_8000": 30}

    def set_default_salary_range
        self.salary_range ||= :"1000_até_3000"
    end

    
end
