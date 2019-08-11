require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do

      it "is valid with all" do
        expect(build(:item)).to be_valid
      end
      it "is valid with a price that has more than 300 yen " do
        item = build(:item, price: "300")
        item.valid?
        expect(build(:item)).to be_valid
      end

      it "is valid with a price that less more than 9999999 yen " do
        item = build(:item, price: "9999999")
        item.valid?
        expect(build(:item)).to be_valid
      end
    end

    context 'can not save' do
      
      it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "is invalid with a name that has more than 41 characters " do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:name][0]).to include("is too long (maximum is 40 characters)")
      end

      it "is invalid without a state" do
        item = build(:item, state: "")
        item.valid?
        expect(item.errors[:state]).to include("can't be blank")
      end

      it "is invalid without a delivery" do
        item = build(:item, delivery: "")
        item.valid?
        expect(item.errors[:delivery]).to include("can't be blank")
      end

      it "is invalid without a region" do
        item = build(:item, region: "")
        item.valid?
        expect(item.errors[:region]).to include("can't be blank")
      end

      it "is invalid without a days" do
        item = build(:item, days: "")
        item.valid?
        expect(item.errors[:days]).to include("can't be blank")
      end

      it "is invalid without a info" do
        item = build(:item, info: "")
        item.valid?
        expect(item.errors[:info]).to include("can't be blank")
      end

      it "is invalid without a delivery" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("is not a number")
      end

      it "is invalid without a price that has less than 299 yen " do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it "is valid with a price that has more than 10000000 yen " do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end
    end
  end
end
