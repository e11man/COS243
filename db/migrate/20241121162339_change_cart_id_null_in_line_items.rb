class ChangeCartIdNullInLineItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :line_items, :cart_id, true
  end
end
