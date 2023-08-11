# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    @user = User.new
    @fragrances = Fragrance.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user.id).thanks_mail.deliver_now
      redirect_to('/')
      flash[:notice] = 'フォームを送信しました'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :message)
  end
end
