require 'rails_helper'
describe Users::AddressesController, type: :request do
  include SpecTestHelper
  before do
    session = {
        user: attributes_for(:user),
        pass: "00000000",
        pass_conf: "00000000"
      }
    add_session(session)
  end

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get users_addresses_url
      expect(response.status).to eq 200
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post users_addresses_url, params: { address: attributes_for(:address) }
        expect(response.status).to eq 302
      end
      it 'リダイレクトすること' do
        post users_addresses_url, params: { address: attributes_for(:address) }
        expect(response.status).to redirect_to register_users_cards_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post users_addresses_url, params: { address: attributes_for(:address, :invalid) }
        expect(response.status).to eq 200
      end
      it 'エラーが表示されること' do
        post users_addresses_url, params: { address: attributes_for(:address, :invalid) }
        expect(response.body).to include '郵便番号を入力してください'
      end
    end
  end
end
