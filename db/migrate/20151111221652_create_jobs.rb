class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :posted
      t.string :company
      t.string :poster
      t.string :city
      t.string :state
      t.string :title
      t.string :body
      t.string :keywords
    end
  end
end
