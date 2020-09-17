require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '出品する商品の新規登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/test_image.png")
    end

    it 'すべての情報が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
    it '価格の範囲が、￥300以上でないと登録できない' do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格の範囲が、￥9999999以下でないと登録できない' do
      @item.price = "100000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格は半角数字でないと、登録できない' do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '価格は半角数字でないと、登録できない' do
      @item.price = "aaaas"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'カテゴリーの[--]は選択できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態の[--]は選択できない' do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it '送料の負担の[--]は選択できない' do
      @item.shopping_cost_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping cost must be other than 1")
    end
    it '発送元の地域の[--]は選択できない' do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it '送料の負担の[--]は選択できない' do
      @item.shopping_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping day must be other than 1")
    end
    it '商品名が空欄だと登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空欄だと登録できない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが空欄だと登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が空欄だと登録できない' do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担が空欄だと登録できない' do
      @item.shopping_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
    end
    it '発送元の地域が空欄だと登録できない' do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it '配送までの日数が空欄だと登録できない' do
      @item.shopping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping day can't be blank")
    end
    it '価格が空欄だと登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '商品画像が空欄だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
   

  end
end