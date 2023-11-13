class ChangePriceToFloatInExperiences < ActiveRecord::Migration[7.1]
  def change
    change_column :experiences, :price, :float
  end
end
