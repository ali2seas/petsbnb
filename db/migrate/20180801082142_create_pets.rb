class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :address
      t.string :category
      t.integer :age
      t.string :size
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
