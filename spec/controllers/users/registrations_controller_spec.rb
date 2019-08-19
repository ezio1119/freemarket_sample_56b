require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    # @user = build(:user)
  end


  describe 'Get #index' do

    it 'returns a 200 response' do
      expect(response).to have_http_status "200"
    end

    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'Get #new' do
    before {get :new, params: {}, session: {} }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns new @user' do
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end

  describe 'Get #tell' do
    before do
      @user = build(:user)
      {get :tell, params: { user: @user }, session: {} }
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :tell template' do
      expect(response).to render_template :tell
    end

    it 'session' do
      expect do
        post :new, params: { user: @user }, session: { user: @user } 
      end.not_to change(User, :count)
    end

  end

  describe 'Post #create' do
  end
end