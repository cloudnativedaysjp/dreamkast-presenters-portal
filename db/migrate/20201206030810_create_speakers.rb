class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :sub
      t.string :profile
      t.string :company
      t.string :job_title
      t.string :twitter_id
      t.string :github_id
      t.string :email

      t.timestamps
    end
  end
end
