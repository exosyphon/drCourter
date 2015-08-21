class TextLog < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone_number
  validates_inclusion_of :text_preference, in: [true, false]
  validates_length_of :phone_number, minimum: 10
end
