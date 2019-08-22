class Card < ApplicationRecord
  Payjp.api_key = Rails.application.credentials.payjp[:PRIVATE_KEY]
  belongs_to :user

  def self.create_token(input_card)
    token = Payjp::Token.create({card: input_card},
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
    token.id
  end

  def self.create_customer
    customer = Payjp::Customer.create(
      description: 'test'
    )
    customer.id
  end

  def self.create_card(customer, token)
    customer = Payjp::Customer.retrieve(customer)
    card = customer.cards.create(
      card: token
    )
    card.id
  end

  def disp_car_info(user)
    res = car_info(user)
    res = {
      brand: res.brand,
      month: res.exp_month,
      year:  res.exp_year,
      last4: res.last4
    }
  end

  def change_def(user)
    cus_info = user.cus_info
    cus_info.default_card  = payjp_car
    cus_info.save
  end

  def destroy_card(user)
    car_info(user).delete
  end

  private
  def car_info(user)
    user.cus_info.cards.retrieve(payjp_car)
  end
end
