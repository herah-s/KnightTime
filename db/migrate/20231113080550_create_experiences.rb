class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.string :address
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
