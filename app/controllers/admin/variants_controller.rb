module Admin
    class VariantsController < BaseController
        def index
            @variants = Variant.all
        end
        
        def show
            @variant = Variant.find_by_id(params[:id])
            @variant_values = @variant.variant_values
        end
        
        def new
            @variant = Variant.new

            @product = Product.find_by_id(params[:product_id])

            @option_types = OptionType.joins(:option_type_products).where(option_type_products: { product_id: @product.id })
            @option_values = @option_types.map(&:option_values).flatten
        end
        
        def create
            @variant = Variant.new(variant_params)

            if @variant.save
                @option_value_ids = params[:option_value_ids]

                @option_value_ids.each do |option_value_id|
                    OptionValueVariant.create(option_value_id: option_value_id, variant_id: @variant.id)
                end

                flash[:notice] = "Variant was successfully created."
                redirect_to admin_variants_path
            else
                flash[:error] = "Variant could not be created."
                render :new
            end
        end
        
        def edit
            @variant = Variant.find_by_id(params[:id])

            @product = Product.find_by_id(params[:product_id])

            @option_types = OptionType.joins(:option_type_products).where(option_type_products: { product_id: @product.id })
            @option_values = @option_types.map(&:option_values).flatten
        end
        
        def update
            @variant = Variant.find_by_id(params[:id])
          
            if @variant.update(variant_params)
              # Update associated OptionValueVariants
              @option_value_ids = params[:option_value_ids]
              @variant.option_value_variants.destroy_all # Remove existing associations
          
              @option_value_ids.each do |option_value_id|
                OptionValueVariant.create(option_value_id: option_value_id, variant_id: @variant.id)
              end
          
              flash[:notice] = "Variant was successfully updated."
              redirect_to admin_product_path(@variant.product)
            else
              flash[:error] = "Variant could not be updated."
              render :edit
            end
          end
          

        
        def destroy
            @variant = Variant.find_by_id(params[:id])
            if @variant.destroy
                flash[:notice] = "Variant was successfully deleted."
                redirect_to admin_variants_path
            else
                flash[:error] = "Variant could not be deleted."
                redirect_to admin_variant_path(@variant)
            end
        end
        
        private
        
        def variant_params
            params.require(:variant).permit(:product_id, :image, :price, :quantity)
        end
    end
end