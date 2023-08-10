module Admin
class ProductsController < BaseController
    def index
         @products = Product.all
    end
    
    def show
        @product = Product.find_by_id(params[:id])
        @option_type_products = @option_types = OptionType.joins(:option_type_products).where(option_type_products: { product_id: @product.id })
    end
    def new
        @product = Product.new
        @option_types = OptionType.all 
    end
    def create
        @product = Product.new(product_params)

        #loop for each optiontype create option type product

        if @product.save
            @option_type_ids = params[:product][:option_type_ids]

            @option_type_ids.each do |option_type_id|
                OptionTypeProduct.create(option_type_id: option_type_id, product_id: @product.id)
            end

            redirect_to admin_product_path(@product)
        else
            render :new
        end
    end
    def edit
        @product = Product.find_by_id(params[:id])
    end
    def update
        @product = Product.find_by_id(params[:id])
        if @product.update(product_params)
            redirect_to admin_product_path(@product)
        else
            render :edit
        end
    end
    def destroy
        @product=Product.find_by_id(params[:id])
        @product.destroy
        redirect_to admin_products_path
    end

    private
    def product_params 
        params.require(:product).permit(:name, :description)
    end
end
end
