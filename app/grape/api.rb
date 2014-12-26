require "entities"
require "helpers"

module DemoAPI

  class API < Grape::API

    #include guard in concerns
    include APIGuard

    prefix "api"
    format :json
    content_type :json, "text/plain;charset=utf-8"

    helpers APIHelpers

    # Authentication:
    # APIs marked as 'require authentication' shoulyd be provided the user's private token,
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

      get 'show' do 
        guard! scopes: [:update, :write]
        { another_scope: 'BalaBala: It could use the token of update&write' }
      end

      get 'write' do 
        guard! scopes: [:write]
        { write_scope: 'BalaBala: I can only use the token for write, also update&write is fun' }
      end

      get 'nothing' do 
        guard! scopes: [:nothing]
        { write_scope: 'BalaBala: I can only use the token for me and public' }
      end

    end


    resource :applications do 
      get do 
        guard!
        @applications = current_user.oauth_applications
        present @applications, with: APIEntities::Application
      end
    end
  end
end
