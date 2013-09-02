class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.string :image
      t.boolean :free_to_award
      t.integer :owner_id

      t.timestamps
    end
    add_index :badges, :owner_id
  end
end
