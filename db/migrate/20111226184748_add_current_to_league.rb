class AddCurrentToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :current, :boolean
    
    League.update_all(:current => true)
  end
end
