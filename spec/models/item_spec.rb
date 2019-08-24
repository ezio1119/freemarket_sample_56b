require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      before do
        @user = FactoryBot.create(:user)
        @category = FactoryBot.create(:category)
      end
      it "is valid with all" do
        user = @user
        category = @category
        item = build(:item)
        item.category_id = category.id
        item.user_id = user.id
        expect(item).to be_valid
      end
      it "is valid with a price that has more than 300 yen " do
        user = @user
        category = @category
        item = build(:item, price: "300")
        item.category_id = category.id
        item.user_id = user.id
        expect(item).to be_valid
      end

      it "is valid with a price that less more than 9999999 yen " do
        user = @user
        category = @category
        item = build(:item, price: "9999999")
        item.category_id = category.id
        item.user_id = user.id
        expect(item).to be_valid
      end

      it "is valid with a name that less more than 40 " do
        test = "A"
        while test.length < 40 do
          test += "A"
        end
        user = @user
        category = @category
        item = build(:item, name: "#{test}")
        item.category_id = category.id
        item.user_id = user.id
        expect(item).to be_valid
      end

      it "is valid with a info that less more than 1000 " do
        test = "A"
        while test.length < 1000 do
          test += "A"
        end
        user = @user
        category = @category
        item = build(:item, info: "#{test}")
        item.category_id = category.id
        item.user_id = user.id
        expect(item).to be_valid
      end

    end

    context 'can not save' do
      
      it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "is invalid with a name that has more than 41 characters " do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:name][0]).to include("は40文字以内で入力してください")
      end

      it "is invalid without a state_id" do
        item = build(:item, state_id: "")
        item.valid?
        expect(item.errors[:state_id]).to include("を入力してください")
      end

      it "is invalid without a delivery_burden_id" do
        item = build(:item, delivery_burden_id: "")
        item.valid?
        expect(item.errors[:delivery_burden_id]).to include("を入力してください")
      end

      it "is invalid without a delivery_method_id" do
        item = build(:item, delivery_method_id: "")
        item.valid?
        expect(item.errors[:delivery_method_id]).to include("を入力してください")
      end

      it "is invalid without a prefecture_id" do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it "is invalid without a day_id" do
        item = build(:item, day_id: "")
        item.valid?
        expect(item.errors[:day_id]).to include("を入力してください")
      end

      it "is invalid without a info" do
        item = build(:item, info: "")
        item.valid?
        expect(item.errors[:info]).to include("を入力してください")
      end

      it "is invalid without a delivery" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

      it "is invalid without a price that has less than 299 yen " do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "is valid with a price that has more than 10000000 yen " do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end  
    end
  end
end
