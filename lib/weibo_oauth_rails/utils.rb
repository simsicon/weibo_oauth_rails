module WeiboOauthRails
  module Utils
    module InstanceMethods
      def create_with_omniauth(auth)
        create! do |user|
          user.provider = auth['provider']
          user.uid = auth['uid']
          if auth['info']
            user.name = auth['info']['name'] || ""
            user.email = auth['info']['email'] || ""
          end
        end
      end


      def authenticate_with_cookie(id, cookie)
        user = find(id) if id
        (user && user.uid == cookie) ? user : nil
      end

      def cookie
        uid
      end
    end
  end
end