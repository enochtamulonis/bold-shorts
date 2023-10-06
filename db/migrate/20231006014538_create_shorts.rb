class CreateShorts < ActiveRecord::Migration[7.0]
  def change
    create_table :shorts do |t|
      t.text :transcription
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
