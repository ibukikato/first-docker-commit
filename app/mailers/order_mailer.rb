class OrderMailer < ApplicationMailer
  def complete(args)
    email = args[:email]
    @url  = 'http://localhost:3000/orders'
    mail(to: email, subject: 'Your order has been completed')
  end

  def thanks_mail
    @customer = current_customer
    mail(to: @customer.email, subject: '新規会員登録ありがとうございました')
  end
end