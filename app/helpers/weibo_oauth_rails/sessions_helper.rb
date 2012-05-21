# encoding: utf-8

module WeiboOauthRails
  module SessionsHelper
    def sign_in(user)
      cookies.permanent.signed[:auth_token] = [user.id, user.cookie]
      self.current_user = user
    end

    def sign_out
      cookies.delete :auth_token
      self.current_user = nil
    end

    def signed_in?
      ! current_user.nil?
    end

    def current_user
      @current_user ||= user_from_cookie
    end

    def current_user=(user)
      @current_user = user
    end

    def current_user?(id)
      current_user.id.to_s == id.to_s
    end

    def to_signin_or_not_to_signin
      if signed_in?
        link_to('登出', '/signout', :method => :delete, :class => 'sign_in_out').html_safe
      else
        link_to image_tag('http://www.sinaimg.cn/blog/developer/wiki/240.png'), '/auth/weibo', :class => 'sign_in_out'
      end
    end

    private

      def user_from_cookie
        User.authenticate_with_cookie(* remember_token)
      end

      def remember_token
        cookies.signed[:auth_token] || [nil, nil]
      end
  end
end
