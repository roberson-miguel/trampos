class Job < ApplicationRecord
    belongs_to :company
    belongs_to :benefit
    belongs_to :skill
    belongs_to :joblevel
    belongs_to :user

    has_many :profilejobs, :dependent => :destroy
    has_many :profiles, :through => :profilejobs
    

    validates :title, :description, :workplace, :end_date, :salary_range, :status, presence: {message: '...deve ser informado'}
    
    enum salary_range: { "1000_to_3000": 0, "3001_to_5000": 15, "5001_to_8000": 30}

    def set_default_salary_range
        self.salary_range ||= :"1000_to_3000"
    end

    enum status: { "active": 0, "disabled": 15}

    def set_default_status
        self.status ||= :"active"
    end
    
end
