# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @customer = current_customer
    @ramn = Ramn.new
  end

  def delivery
    @ramn = Ramn.new(ramn_params)
    if @ramn.save
      OrderMailer.with(email: current_customer.email).thanks_mail.deliver_now
      redirect_to('/')
      flash[:notice] = 'フォームを送信しました'
    else
      render :new
    end
  end

  private

  def ramn_params
    params.require(:ramn).permit(:text)
  end
end
