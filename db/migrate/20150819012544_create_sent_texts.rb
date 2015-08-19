class CreateSentTexts < ActiveRecord::Migration
  def change
    create_table :sent_texts do |t|
      t.string :phone_number
      t.string :message

      t.timestamps null: false
    end
  end
end
