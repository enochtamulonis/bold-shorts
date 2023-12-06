class CreateShorts < ActiveRecord::Migration[7.0]
  def change
    create_table :shorts do |t|
      t.string :text
      t.decimal :duration

      t.timestamps
    end
  end
end
