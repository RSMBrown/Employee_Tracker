class CreateDivisionUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :division_users do |t|
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :division, foreign_key: true 

      t.timestamps
    end
  end
end
