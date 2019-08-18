require 'rails_helper'

describe ItemsController do

  describe 'GET #index' do
    it "renders the :index template" do
      items = create_list(:item,1)
      get :index
      expect(response).to render_template :index
    end
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe 'GET #show' do
    before do
      @userA = FactoryBot.create(:user)
      @item = create_list(:item,1)
    end
    it "renders the :show template" do
      get :show, params:{ id: @item[0]}
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      @userA = FactoryBot.create(:user)
      @userB = FactoryBot.create(:user)
    end
    it "renders the :new template" do
      sign_in @userA
      get :new
      expect(response).to render_template :new
    end
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe 'GET #create' do
    before do
      @userA = FactoryBot.create(:user)
    end
    it "renders the :create template" do
      sign_in @userA
      get :create, params: {item:{
                            size_id:"1", 
                            name: "1", 
                            state_id: "1", 
                            delivery_burden_id: "1", 
                            delivery_method_id: "1", 
                            prefecture_id: "1", 
                            day_id: "1", 
                            price: "1", 
                            info: "aaaaaa", 
                            user_id: "1", 
                            category_id: "1",
                            brand_id:"1"
                          }}
      expect(response).to render_template :new
    end
  end

  describe 'GET #buy' do
    before do
      @userA = FactoryBot.create(:user)
      @item = create_list(:item,1)
    end
    it "renders the :buy template" do
      sign_in @userA
      get :buy, params: { id: @item[0]}
      expect(response).to render_template :buy
    end
  end

  describe 'GET #search' do
    before do
      @userA = FactoryBot.create(:user)
      @item = create_list(:item,1)
    end
    it "renders the :search template" do
      sign_in @userA
      get :search, params: { id: @item[0] }
      expect(response).to render_template :search
    end
  end

  describe 'GET #edit' do
    before do
      @userA = FactoryBot.create(:user)
      @item = create_list(:item,1)
    end
    it "renders the :edit template" do
      sign_in @userA
      get :edit, params: { id: @item[0] }
      expect(response).to render_template :edit
    end
  end
end