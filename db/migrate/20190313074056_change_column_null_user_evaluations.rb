class ChangeColumnNullUserEvaluations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :user_evaluations, :high_count, true
    change_column_null :user_evaluations, :medium_count, true
    change_column_null :user_evaluations, :low_count, true
    change_column_null :user_evaluations, :evaluating_id, false
    change_column_null :user_evaluations, :evaluated_id, false
    change_column_null :user_evaluations, :comment, true

    add_index :user_evaluations, :evaluating_id
    add_index :user_evaluations, :evaluated_id
  end
end
