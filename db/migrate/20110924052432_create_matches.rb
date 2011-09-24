class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.integer :league_id
      t.integer :creator_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
