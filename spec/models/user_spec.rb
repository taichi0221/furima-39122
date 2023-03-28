require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "苗字が空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "苗字が半角では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "muta", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Last name Input full-width characters")
    end
    it "名前が空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "名前が半角では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "taichi", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("First name Input full-width characters")
    end
    it "苗字のカナが空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "苗字のカナがひらがなと漢字では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "む田", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
    end
    it "名前のカナが空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名前のカナがひらがなと漢字では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"た一",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
    end
    it "誕生日が空では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user00", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "パスワードと確認パスワードが不一致では登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "user00", password_confirmation: "user12", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは数字と英語組み合わせないと登録できない" do
      user = User.new(nickname: "がけっぷち", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "むた", first_name: "たいち", last_name_kana: "ムタ", first_name_kana:"タイチ",birth_day: "1984-02-21")
      user.valid?
      expect(user.errors.full_messages).to include("Password Include both letters and numbers")
    end

  end
end