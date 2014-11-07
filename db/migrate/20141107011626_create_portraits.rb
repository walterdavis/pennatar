class CreatePortraits < ActiveRecord::Migration
  def change
    create_table :portraits do |t|
      t.string :img
      t.references :person, index: true

      t.timestamps
    end
  end
end
