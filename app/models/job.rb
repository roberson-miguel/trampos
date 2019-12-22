class Job < ApplicationRecord
    belongs_to :company
    belongs_to :benefit
    belongs_to :skill
    belongs_to :joblevel
    belongs_to :user

    has_many :profile_jobs, :dependent => :destroy
    has_many :profiles, :through => :profile_jobs
    

    validates :title, :description, :workplace, :end_date, :salary_range, :status, presence: {message: '...deve ser informado'}
    
    enum salary_range: { "1000_até_3000": 0, "3001_até_5000": 15, "5001_até_8000": 30}

    def set_default_salary_range
        self.salary_range ||= :"1000_até_3000"
    end

    enum status: { "ativa": 0, "desativada": 15}

    def set_default_status
        self.status ||= :"ativa"
    end
    
end
