class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.belongs_to :user, index: true, foriegn_key: true 
      t.string :title

      t.timestamps
    end
  end
end
