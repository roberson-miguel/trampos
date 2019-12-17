class Job < ApplicationRecord

    enum salary_range: { "1000_até_3000": 0, "3001_até_5000": 15, "5001_até_8000": 30}

    def set_default_salary_range
        self.salary_range ||= :"1000_até_3000"
    end

    
end
