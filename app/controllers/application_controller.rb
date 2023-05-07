class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken

        # before_action :authenticate_user!

        def after_sign_out_path_for(resource_or_scope)
          root_path
        end

        protected

        def after_sign_in_path_for(resource)
          # Replace this with the path you want to redirect to after sign in
          root_path
        end

        private

        def current_user
          @current_user ||= User.find_by(id: session[:user_id])
        end

        helper_method :current_user
end
