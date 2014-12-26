module DemoAPI
  module APIEntities
    class User < Grape::Entity
      expose :id, :email
    end

    class Application < Grape::Entity
      expose :name, :uid, :secret
    end

  end 
end
