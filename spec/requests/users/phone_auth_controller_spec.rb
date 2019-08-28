require 'rails_helper'

describe Users::PhoneAuthController, type: :request do
  include SpecTestHelper


  describe 'GET #index' do
    it 'リクエストが成功すること' do
      session = {
        user: attributes_for(:user),
        pass: "00000000",
        pass_conf: "00000000"
      }
      add_session(session)
      get users_phone_auth_index_url
      expect(response.status).to eq 200
    end
  end

  describe 'POST #conf_num' do
    before 'sessionを追加する' do 
      session = {
        user: attributes_for(:user),
        pass: "00000000",
        pass_conf: "00000000",
        conf_num: "1234"
      }
      add_session(session)
    end

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post conf_num_users_phone_auth_index_url, params: {conf_num: "1234"}
        expect(response.status).to eq 302
      end

      it 'リダイレクトすること' do
        post conf_num_users_phone_auth_index_url, params: {conf_num: "1234"}
        expect(response).to redirect_to users_addresses_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post conf_num_users_phone_auth_index_url, params: {conf_num: "4321"}
        expect(response.status).to eq 200
      end

      it 'エラーが表示されること' do
        post conf_num_users_phone_auth_index_url, params: {conf_num: "4321"}
        expect(response.body).to include '認証番号が一致しません'
      end
    end
  end
end
