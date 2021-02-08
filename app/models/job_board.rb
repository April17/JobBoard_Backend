class JobBoard < ApplicationRecord
    has_many :job_board_job_opportunities
    has_many :job_opportunities, through: :job_board_job_opportunities
end
