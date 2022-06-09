class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :action_item
      t.string :status, default: 'waiting'
      t.string :urgency
      t.string :impact
      t.date :deadline
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
