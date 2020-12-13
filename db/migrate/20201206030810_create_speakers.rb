class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :abbr
      t.integer :status

      t.timestamps
    end

    create_table :speakers do |t|
      t.string :name
      t.string :sub
      t.string :profile
      t.string :company
      t.string :job_title
      t.string :twitter_id
      t.string :github_id
      t.string :email
      t.belongs_to :conference

      t.timestamps
    end
  end
end
