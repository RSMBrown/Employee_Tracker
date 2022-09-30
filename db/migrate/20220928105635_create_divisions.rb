class CreateDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :divisions do |t|
      t.belongs_to :user, index: true, foriegn_key: true 
      t.string :name

      t.timestamps
    end
  end
end
