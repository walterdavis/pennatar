class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :pennid
      t.string :photo_key
      t.references :selected_portrait, index: true

      t.timestamps
    end
    add_index :people, :photo_key
  end
end
