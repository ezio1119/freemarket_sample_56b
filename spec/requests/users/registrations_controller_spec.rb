require 'rails_helper'

describe Users::RegistrationsController, type: :request do
  include SpecTestHelper

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get users_index_url
      expect(response.status).to eq 200
    end
  end

  describe 'POST #put_in' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post users_put_in_url, params: { user: attributes_for(:user) }
        expect(response.status).to eq 302
      end
      it 'リダイレクトすること' do
        post users_put_in_url, params: { user: attributes_for(:user) }
        expect(response).to redirect_to users_phone_auth_index_path
      end
    end
    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post users_put_in_url, params: { user: attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end
      it 'エラーが表示されること' do
        post users_put_in_url, params: { user: attributes_for(:user, :invalid) }
        expect(response.body).to include "ニックネームを入力してください"
      end
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      before 'sessionを追加する' do
        session = {
          user: attributes_for(:user),
          address: attributes_for(:address),
          payjp_car: [{
            payjp_car: "car_xxxxxxxxxxxxxxxxxxxxxxxx"
          }],
          payjp_cus: "cus_xxxxxxxxxxxxxxxxxxxxxxxx",
          pass: "00000000",
          pass_conf: "00000000"
        }
        add_session(session)
      end

      it 'リクエストが成功すること' do
        post user_registration_url
        expect(response.status).to eq 200
      end
      
      it 'ユーザーが登録されること' do
        expect do
          post user_registration_url
        end.to change(User, :count).by(1)
      end

      it 'リダイレクトすること' do
        post user_registration_url
        expect(response).to render_template :create
      end
    end

    context 'パラメータが不正な場合' do
      before 'sessionを追加する' do
        session = {
          user: attributes_for(:user, :invalid),
          address: attributes_for(:address),
          payjp_car: [{
            payjp_car: "car_xxxxxxxxxxxxxxxxxxxxxxxx"
          }],
          payjp_cus: "cus_xxxxxxxxxxxxxxxxxxxxxxxx",
          pass: "00000000",
          pass_conf: "00000000"
        }
        add_session(session)
      end

      it '例外処理が発生すること' do
        expect {
          post user_registration_url
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'ユーザーが登録されないこと' do
        expect do
          begin
            post user_registration_url
          rescue
          end
        end.to_not change(User, :count)
      end
    end
  end
end
