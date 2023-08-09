module Admin
    class BaseController < ApplicationController
      before_action :authenticate_user!
      before_action :require_admin
  
      private
  
      def require_admin
        unless current_user_is_admin?
          flash[:alert] = "You don't have permission to access this page."
          redirect_to root_path
        end
      end
  
      def current_user_is_admin?
        current_user && current_user.role == "admin"
      end
    end
  end
  