require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with all" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end


    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_date" do
      user = build(:user, birth_date: "")
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user, email: "test@example.com")
      another_user = build(:user, email: "test@example.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a nickname that has more than 21 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "is invalid with a first_name that has only double-byte" do
      user = build(:user, first_name: "あ")
      expect(user).to be_valid
    end

    it "is invalid with a first_name that has not double-byte" do
      user = build(:user, first_name: "a")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "is invalid with a last_name that has only double-byte" do
      user = build(:user, last_name: "あ")
      expect(user).to be_valid
    end

    it "is invalid with a last_name that has not double-byte" do
      user = build(:user, last_name: "a")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "is invalid with a first_name_kana that has only full-width katakana" do
      user = build(:user, first_name_kana: "ア")
      expect(user).to be_valid
    end

    it "is invalid with a first_name_kane that has not full-width katakana" do
      user = build(:user, first_name_kana: "a")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "is invalid with a last_name_kana that has only full-width katakana" do
      user = build(:user, last_name_kana: "ア")
      expect(user).to be_valid
    end

    it "is invalid with a last_name_kane that has not full-width katakana" do
      user = build(:user, last_name_kana: "a")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
  end
end