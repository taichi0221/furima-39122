require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:birth_day) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name_kana) }
    it { is_expected.to validate_presence_of(:first_name_kana) }
    it { is_expected.to allow_value('Abc123').for(:password) }
    it { is_expected.not_to allow_value('abc123').for(:password).with_message('Include both letters and numbers') }
    it { is_expected.not_to allow_value('あいうえお').for(:last_name).with_message('Input full-width characters') }
    it { is_expected.not_to allow_value('あいうえお').for(:first_name).with_message('Input full-width characters') }
    it { is_expected.not_to allow_value('アイウエオ').for(:last_name_kana).with_message('is invalid. Input full-width katakana characters') }
    it { is_expected.not_to allow_value('アイウエオ').for(:first_name_kana).with_message('is invalid. Input full-width katakana characters') }
  end
end  

end
