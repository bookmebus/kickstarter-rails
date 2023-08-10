module Admin
    class OptionValuesController < BaseController
        before_action :set_option_value, only: [:show, :edit, :update, :destroy]
        
        def index
            @option_values = OptionValue.all
        end
        
        def show
        end
        
        def new
            @option_value = OptionValue.new
        end
        
        def create
            @option_value = OptionValue.new(option_value_params)
            if @option_value.save
                flash[:notice] = "Option Value was successfully created."
                redirect_to admin_option_type_path(params[:option_type_id])
            else
                flash[:error] = "Option Value could not be created."
                render :new
            end
        end
        
        def edit
            @option_value = OptionValue.find_by_id(params[:id])
        end
        
        def update
            @option_value = OptionValue.find_by_id(params[:id])

            if @option_value.update(option_value_params)
                flash[:notice] = "Option Value was successfully updated."
                redirect_to admin_option_types_path
            else
                flash[:error] = "Option Value could not be updated."
                render :edit
            end
        end
        
        def destroy
            if @option_value.destroy
                flash[:notice] = "Option Value was successfully deleted."
                redirect_to admin_option_values_path
            else
                flash[:error] = "Option Value could not be deleted."
                redirect_to admin_option_value_path(@option_value)
            end
        end
        
        private
        
        def set_option_value
            @option_value = OptionValue.find_by_id(params[:id])
        end
        
        def option_value_params
            params.permit(:value, :option_type_id)
        end
    end
end