class ChargesController < ApplicationController
  
  def new
  end
  
  def create
    # Amount in cents
    @cart = current_order
    @amount = (@cart.subtotal * 100).to_i
  
    # customer = Stripe::Customer.create({
    #   email: params[:stripeEmail],
    #   source: params[:stripeToken],
    # })
  
    # charge = Stripe::Charge.create({
    #   customer: customer.id,
    #   amount: @amount,
    #   description: 'Rails Stripe customer',
    #   currency: 'eur',
    # })

    # @order = Order.create(number_order: 4584472255445583, state: 'En cours de préparation', delivery_mode: 'À domicile', delivery_address: '70 Rue Jacques Prévers', amount_ht: 10.00, amount_ttc: 12.00, user_id: User.first.id, cart_id: Cart.first.id)
  
    OrderItem.destroy_all

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # def new
  # end
  
  # def create
  #   # Amount in cents
  #   @cart = current_order
  #   @amount = (@cart.subtotal * 100).to_i
  
  #   customer = Stripe::Customer.create({
  #     email: params[:stripeEmail],
  #     source: params[:stripeToken],
  #   })
  
  #   charge = Stripe::Charge.create({
  #     customer: customer.id,
  #     amount: @amount,
  #     description: 'Rails Stripe customer',
  #     currency: 'eur',
  #   })
    
  #   # @order = Order.create(stripe_customer_id: customer.id, user_id: current_user.id)

  #   @order_items = @cart.items.each do |item|
  #     JoinTableOrderItem.create(item_id: item.id, order_id: @order.id)
  #   end
    
  #   @cart.items.destroy_all
    
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end
end
