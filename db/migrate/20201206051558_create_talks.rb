class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.string :title
      t.string :abstract
      t.integer :conference_id

      t.timestamps
    end
  end
end
