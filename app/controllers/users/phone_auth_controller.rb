

class Users::PhoneAuthController < ApplicationController
  before_action :set_credential, only: :send_sms
  before_action :session_exists?
  include SessionCheck

  def index
  end

  def send_sms
    num = params[:num]
    reg = /(070|080|090)\d{4}\d{4}/
    unless num.match(reg) && num.length == 11
      return redirect_to users_phone_auth_index_path, notice: "電話番号の書式を確認してください"
    end
    num.slice!(0)
    client = Twilio::REST::Client.new(@sid, @token)

    from = "#{@twilio_num}"
    to = "+81#{num}"
    conf_num = rand(10000)
    session[:conf_num] = conf_num.to_s

    client.messages.create(
      from: from,
      to: to,
      body: "認証番号は「#{conf_num}」です。"
    )
  end 

  def conf_num
    if session[:conf_num] == params[:conf_num]
      redirect_to users_addresses_path
    else
      flash.now[:notice] = "認証番号が一致しません"
      render "send_sms"
    end
  end

  def set_credential
    @sid = Rails.application.credentials.twilio[:ACCOUNT_SID]
    @token = Rails.application.credentials.twilio[:AUTH_TOKEN]
    @twilio_num = Rails.application.credentials.twilio[:PHONE_NUMBER]
  end
end
