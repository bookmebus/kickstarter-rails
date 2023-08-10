module Admin
    class VariantsController < BaseController
        def index
            @variants = Variant.all
        end
        
        def show
            @variant = Variant.find_by_id(params[:id])
        end
        
        def new
            @variant = Variant.new
        end
        
        def create
            @variant = Variant.new(variant_params)
            if @variant.save
                flash[:notice] = "Variant was successfully created."
                redirect_to admin_variants_path
            else
                flash[:error] = "Variant could not be created."
                render :new
            end
        end
        
        def edit
            @variant = Variant.find_by_id(params[:id])
        end
        
        def update
            @variant = Variant.find_by_id(params[:id])
            if @variant.update(variant_params)
                redirect_to admin_variant_path(@variant)
            else
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
            params.require(:variant).permit(:name)
        end
    end
end