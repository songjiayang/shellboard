class CreateJobSubs < ActiveRecord::Migration
  def change
    create_table :job_subs do |t|
      t.string :email
      t.integer :language
      t.boolean :confirm
      t.string :confirm_token
      t.boolean :enable

      t.timestamps
    end

    add_index :job_subs, :language
    add_index :job_subs, :enable
    add_index :job_subs, :confirm
    add_index :job_subs, [:email, :confirm_token, :language] , :unique => true
  end
end
