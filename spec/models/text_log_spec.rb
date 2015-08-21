require 'spec_helper'

describe TextLog do
  describe '#validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :phone_number }
    it { should validate_length_of(:phone_number).is_at_least(10) }

    it 'makes sure text preference is filled out' do
      text_log = described_class.new(text_preference: nil)
      text_log.valid?
      expect(text_log.errors[:text_preference]).to eq ['is not included in the list']
    end
  end
end