require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

  
    it "すべての情報が正しく入力されていればユーザー登録できる" do
      expect(@user).to be_valid
    end


    it "mailが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "mailは、@を含まないと登録できない" do
      @user.email = "aaagmail.com"
      @user.valid?
    end
    it "passwordは、6文字以上でないと登録できない" do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは、半角英数字混合でないと登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは、半角英数字混合でないと登録できない" do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.first_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.last_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_name_kanaは、全角（カタカナ）でないと登録できない" do
      @user.first_name_kana = "田中"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "last_name_kanaは、全角（カタカナ）でないと登録できない" do
      @user.last_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    

  end
end