class JobOpportunity < ApplicationRecord
    has_one :job_board_job_opportunity
    has_one :job_board, through: :job_board_job_opportunity
end
