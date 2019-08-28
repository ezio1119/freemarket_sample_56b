require 'rails_helper'

describe ItemsController do

  before do
    user = create(:user)
    category = create(:category)
    sign_in user
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      item = create(:item)
      get :show, params: { id: item}
      expect(response).to render_template :show
    end

    it "assigns the requested item to @item" do
      item = create(:item)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "successfully saved @item" do
      item = create(:item)
      expect{
        post :create, params: { item: attributes_for(:item).merge(category_id: item.category_id) }
      }.to change(Item, :count).by(0)
    end
  end


  describe 'GET #edit' do
    it "renders the :edit template" do
      item = create(:item)
      get :edit, params: { id: item}
      expect(response).to render_template :edit
    end

    it "assigns the requested item to @item" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end
  end

end