class JobBoardJobOpportunity < ApplicationRecord
    belongs_to :job_opportunity
    belongs_to :job_board
end
