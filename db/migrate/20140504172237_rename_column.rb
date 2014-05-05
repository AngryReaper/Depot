class RenameColumn < ActiveRecord::Migration
  #def change
  
  #end
  def self.up
    rename_column :products, :decription, :description
  end
end
