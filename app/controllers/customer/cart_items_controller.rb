class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: %i[increase decrease destroy]

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.line_total }
  end

  def create
    product_id = params[:cart_item][:product_id]
    quantity = params[:cart_item][:quantity].to_i
    fragrance_id = params[:cart_item][:fragrance_id]
    increase_or_create(product_id, quantity, fragrance_id)
    redirect_back(fallback_location: products_path, notice: 'カートに追加')
  end

  def pay
    @cart_items = current_customer.cart_items
    order= Order.new(
      customer_id: current_customer.id,
      name: cart_items_params[:name],
      postal_code: cart_items_params[:postal_code],
      prefecture: cart_items_params[:prefecture],
      address1: cart_items_params[:address1],
      address2: cart_items_params[:address2], # もし必要ならばaddress2も追加
      postage: POSTAGE,
      billing_amount: cart_items_params[:billing_amount],
      status: 'confirm_payment'
    )
    order.save
    @cart_items.each do |cart_item|
      create_order_details(order, cart_item)
    end
    @cart_items.destroy_all
    OrderMailer.complete(email: current_customer.email).deliver_now
    redirect_to root_path
  end

  def increase
    @cart_item.increment!(:quantity, 1)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def decrease
    decrease_or_destroy(@cart_item)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer, notice: 'Successfully deleted one cart item'
  end

  private

  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def increase_or_create(product_id, quantity, fragrance_id)
    cart_item = current_customer.cart_items.find_by(product_id: product_id)
    if cart_item
      cart_item.increment!(:quantity, quantity)
    else
      product = Product.find(product_id)
      current_customer.cart_items.build(product: product, quantity: quantity, fragrance_id: fragrance_id).save
    end
  end

  def decrease_or_destroy(cart_item)
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity, 1)
    else
      cart_item.destroy
    end
  end

  def cart_items_params
    params.require(:cart_item).permit(:name, :postal_code, :prefecture, :address1, :address2, :billing_amount)
  end

  def create_order_details(order, cart_item)
    purchased_product = cart_item.product
    purchased_fragrance = cart_item.fragrance
    order_detail = order.order_details.new({
      product_id: purchased_product.id,
      fragrance_id: purchased_fragrance.id,
      price: purchased_product.price,
      quantity: cart_item.quantity
    })
    order_detail.save
  end
end

