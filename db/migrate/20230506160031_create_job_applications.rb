class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :resume
      t.text :cover_letter
      t.string :status, default: 'NOT_SEEN'
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.timestamps
    end
  end
end
