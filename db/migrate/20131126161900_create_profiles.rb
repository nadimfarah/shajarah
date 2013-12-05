class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :fathername
      t.string :lastname
      t.string :relation
      t.references :user, index: true

      t.timestamps
    end
  end
end
