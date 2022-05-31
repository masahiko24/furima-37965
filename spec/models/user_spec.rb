require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do

    context '新規登録が上手く行く時' do
      it "nicknameとemail、passwordとpassword_confiramation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

    it 'ニックネームが必須であること。' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'メールアドレスが必須であること。' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'メールアドレスが一意性であること。' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = FactoryBot.build(:user, email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスは、@を含む必要があること。' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること。' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  end

  describe '新規登録/本人情報確認' do

    context '新規登録が上手く行く時' do
      it "family_nameが全角文字であれば登録できる" do
        @user.last_name = "田中"
        expect(@user).to be_valid
      end

      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it "family_name_kanaが全角カナであれば登録できる" do
        @user.last_name_reading = "タナカ"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナであれば登録できる" do
        @user.first_name_reading = "ハジメ"
        expect(@user).to be_valid
      end

    it 'お名前(全角)は、名字がそれぞれ必須であること。' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'お名前(全角)は、名前がそれぞれ必須であること。' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end

    it ' お名前カナ(全角)は、名字がそれぞれ必須であること。' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name reading can't be blank", "First name reading is invalid"
    end

    it ' お名前カナ(全角)は、名前がそれぞれ必須であること。' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading can't be blank", "Last name reading is invalid"
    end

    it ' お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.last_name_reading = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading is invalid"
    end

    it '生年月日が必須であること。' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end

end
