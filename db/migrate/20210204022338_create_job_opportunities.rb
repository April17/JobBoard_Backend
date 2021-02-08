class CreateJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_opportunities do |t|
      t.string :job_title
      t.string :company_name
      t.string :job_url
      t.string :job_source
      t.timestamps
    end
  end
end