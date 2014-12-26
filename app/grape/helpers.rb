module DemoAPI
 module APIHelpers
   def warden
     env['warden']
   end

   def current_user 
     @current_user ||= User.find(params[:id])
   end

   def authenticate!
      error!({ "error" => "401 Unauthorized" }, 401) unless current_user
    end
 end
end
