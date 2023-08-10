module Admin
    class OptionTypesController < BaseController
        def index
            @option_types = OptionType.all
        end
        
        def show
            @option_type = OptionType.find_by_id(params[:id])
        end
        
        def new
            @option_type = OptionType.new
        end
        
        def create
            @option_type = OptionType.new(option_type_params)
            if @option_type.save
                flash[:notice] = "Option Type was successfully created."
                redirect_to admin_option_types_path
            else
                flash[:error] = "Option Type could not be created."
                render :new
            end
        end
        
        def edit
            @option_type = OptionType.find_by_id(params[:id])
        end
        
        def update
            @option_type = OptionType.find_by_id(params[:id])
            if @option_type.update(option_type_params)
                flash[:notice] = "Option Type was successfully updated."
                redirect_to admin_option_type_path(@option_type)
            else
                flash[:error] = "Option Type could not be updated."
                render :edit
            end
        end
        
        def destroy
            @option_type = OptionType.find_by_id(params[:id])
            if @option_type.destroy
                flash[:notice] = "Option Type was successfully deleted."
                redirect_to admin_option_types_path
            else
                flash[:error] = "Option Type could not be deleted."
                redirect_to admin_option_type_path(@option_type)
            end
        end
        
        private
        
        def option_type_params
            params.require(:option_type).permit(:name)
        end
    end
end