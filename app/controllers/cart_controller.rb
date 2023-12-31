class CartController < ApplicationController
    def show
      @render_cart = false
    end
  
    def add
        @product = Product.find_by(id: params[:id])
        quantity = params[:quantity].to_i
        @variant = @product.variants.first
        
        current_orderable = @cart.orderables.find_by(product_id: @product.id)
        
      if current_orderable && quantity > 0
        current_orderable.update(quantity: quantity)
      elsif quantity <= 0
        current_orderable.destroy if current_orderable
      else
        @cart.orderables.create(product: @product, variant: @variant, quantity: quantity)
      end
    
      respond_to do |format|
        format.turbo_stream do
          # Render the cart partial in the "cart" Turbo Stream frame
          render turbo_stream: turbo_stream.replace('carts',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart })
        end
      end
    end
  
    def remove
      Orderable.find_by(id: params[:id]).destroy
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart })
        end
      end
    end
  end
  