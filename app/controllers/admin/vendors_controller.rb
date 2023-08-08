module Admin
    class VendorsController < BaseController
        def index
            @vendors = Vendor.all
        end
        
        def show
            @vendor = Vendor.find_by_id(params[:id])
        end
        
        def new
            @vendor = Vendor.new
        end
        
        def create
            @vendor = Vendor.new(vendor_params)
            if @vendor.save
                flash[:notice] = "Vendor was successfully created."
                redirect_to admin_vendor_path(@vendor)
            else
                flash[:error] = "Vendor could not be created."
                render :new
            end
        end
        
        def edit
            @vendor = Vendor.find_by_id(params[:id])
        end
        
        def update
            @vendor = Vendor.find_by_id(params[:id])
            if @vendor.update(vendor_params)
                redirect_to admin_vendor_path(@vendor)
            else
                render :edit
            end
        end
        
        def destroy
            @vendor = Vendor.find_by_id(params[:id])
            if @vendor.destroy
                flash[:notice] = "Vendor was successfully deleted."
                redirect_to admin_vendors_path
            else
                flash[:error] = "Vendor could not be deleted."
                redirect_to admin_vendor_path(@vendor)
            end
        end
        
        private
        
        def vendor_params
            params.require(:vendor).permit(:name, :email, :phone, :profile_image, :cover_image, :product_type)
        end
    end
end