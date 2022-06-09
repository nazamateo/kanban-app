class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :project_title
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

