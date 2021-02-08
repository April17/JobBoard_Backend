class CreateJobBoardJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_board_job_opportunities do |t|
      t.integer :job_board_id
      t.integer :job_opportunity_id
      
      t.timestamps
    end
  end
end
