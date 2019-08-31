class CreateSentTexts < ActiveRecord::Migration[4.2]
  def change
    create_table :sent_texts do |t|
      t.string :phone_number
      t.string :message

      t.timestamps null: false
    end
  end
end
