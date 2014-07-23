class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :job_type, defult: 0
      t.string :company_name
      t.integer :occupation, defult: 0
      t.string :location
      t.text :description
      t.text :apply_information
      t.date :deadline
      t.integer :aasm_state, defult: 0
      t.integer :city, defult: 0
      t.string :identifier
      t.string :url
      t.integer :language, defult: 0

      t.timestamps
    end

  end
end
