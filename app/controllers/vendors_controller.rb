class VendorsController < ApplicationController
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
            redirect_to @vendor
        else
            render :new
        end
    end
    
    def edit
        @vendor = Vendor.find_by_id(params[:id])
    end
    
    def update
        @vendor = Vendor.find_by_id(params[:id])
        if @vendor.update(vendor_params)
            redirect_to @vendor
        else
            render :edit
        end
    end
    
    def destroy
        @vendor = Vendor.find_by_id(params[:id])
        @vendor.destroy
        redirect_to vendors_path
    end
    
    private
    
    def vendor_params
        params.require(:vendor).permit(:name, :email, :phone, :profile_image, :cover_image, :product_type)
    end
end