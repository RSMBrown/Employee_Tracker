class CreateProjectUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :project_users do |t|
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :project, foreign_key: true 

      t.timestamps
    end
  end
end
