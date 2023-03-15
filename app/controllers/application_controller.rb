class ApplicationController < ActionController::Base
    # adminとuserの遷移制限
    before_action :authenticate_admin!, if: -> { request.path =~ /^\/admin/ }
    before_action :authenticate_user!, if: -> { request.path =~ /^\/user/ || request.path =~ /^\/post/}

    private
    
    def after_sign_in_path_for(resource_or_scope)
        if resource_or_scope.is_a?(Admin)
          admin_root_path
        else
          posts_path
        end
    end
    
    
    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :user
            root_path
        elsif resource_or_scope == :admin
            new_admin_session_path
        else
            new_user_registration_path
        end
    end
end
