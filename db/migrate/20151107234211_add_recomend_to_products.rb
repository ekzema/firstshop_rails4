class AddRecomendToProducts < ActiveRecord::Migration
  def change
    add_column :products, :recommend, :integer
  end
end
