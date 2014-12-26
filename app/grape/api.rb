require "entities"
require "helpers"

module DemoAPI
  class API < Grape::API
    prefix "api"
    format :json

    helpers APIHelpers

    # Authentication:
    # APIs marked as 'require authentication' should be provided the user's private token,
    # either in post body or query string, named "token"

    resource :users do

      # Get active topics list
      # params[:page]
      # params[:per_page]: default is 30
      # Example
      #   /api/users/profile?id=15
      get 'profile' do
        @user = current_user
        present @user, with: APIEntities::User
      end
    end

    resource :applications do 
      get do 
        @applications = current_user.oauth_applications
        present @applications, with: APIEntities::Application
      end
    end
  end
end
