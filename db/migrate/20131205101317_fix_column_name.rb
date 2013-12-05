class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :profiles, :User_id, :user_id
  end
end
