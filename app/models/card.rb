class Card < ApplicationRecord
  Payjp.api_key = Rails.application.credentials.payjp[:PRIVATE_KEY]
  belongs_to :user

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

  def payment(amount)
    charge = Payjp::Charge.create(
      amount: amount,
      customer: self.customer,
      currency: 'jpy'
    )
    charge.id
  end

  def card_info
    # customer = Payjp::Customer.retrieve(self.customer)
    res = set_customer.cards.retrieve(self.card)
    card_info = {
      brand: res.brand,
      month: res.exp_month,
      year:  res.exp_year,
      last4: res.last4
    }
  end

  def destroy_card
    customer = Payjp::Customer.retrieve(self.customer)
    card = customer.cards.retrieve(self.card)
    res = card.delete
    res.deleted
  end

  private
  def set_customer
    Payjp::Customer.retrieve(self.customer)
  end
end
