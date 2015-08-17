class CreateTextLogs < ActiveRecord::Migration
  def change
    create_table :text_logs do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.boolean :text_preference
      t.string :notes

      t.timestamps null: false
    end
  end
end
