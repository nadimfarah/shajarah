class AddImageToAuthorizations < ActiveRecord::Migration
  def change
  	    add_column :authorizations, :image, :string
  end
end
