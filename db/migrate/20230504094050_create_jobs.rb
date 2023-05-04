class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :company
      t.string :location
      t.string :job_type
      t.text :requirements
      t.datetime :published_at
      t.datetime :expires_at
      t.timestamps
    end
  end
end
