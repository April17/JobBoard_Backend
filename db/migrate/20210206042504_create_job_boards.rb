class CreateJobBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :job_boards do |t|
      t.string :name
      t.string :rating
      t.string :root_domain
      t.string :logo_file
      t.string :description
      t.timestamps
    end
  end
end
