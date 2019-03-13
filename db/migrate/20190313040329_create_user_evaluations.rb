class CreateUserEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_evaluations do |t|
      t.integer :high_count
      t.integer :medium_count
      t.integer :low_count
      t.integer :evaluating_id
      t.integer :evaluated_id
      t.text :comment

      t.timestamps
    end
  end
end
