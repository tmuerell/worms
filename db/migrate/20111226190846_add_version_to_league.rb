class AddVersionToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :version, :integer
    
    League.update_all(:version => 1)
  end
end
