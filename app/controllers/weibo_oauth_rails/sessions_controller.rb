module WeiboOauthRails
  class SessionsController < ApplicationController
    helper WeiboOauthRails::SessionsHelper
    skip_filter :authenticate, only: [ :new, :create ]

    def new
      redirect_to '/auth/weibo'
    end

    def create
      auth = request.env["omniauth.auth"]
      user = User.where(:provider => auth['provider'], 
                        :uid => auth['uid']).first || create_with_omniauth(auth)
      sign_in(user)
      # if !user.email
      #       redirect_to edit_user_path(user), :alert => "Please enter your email address."
      #     else
      #       redirect_to root_url, :notice => 'Signed in!'
      #     end

      redirect_to root_url, :notice => 'Signed in!'

    end

    def destroy
      sign_out
      redirect_to root_url, :notice => 'Signed out!'
    end

    def failure
      redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
    end

    def authenticate
      redirect_to :signin unless signed_in?
    end
    
    def create_with_omniauth(auth)
      User.create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        if auth['info']
          user.name = auth['info']['name'] || ""
          user.email = auth['info']['email'] || ""
        end
      end
    end
    
    def authenticate_with_cookie(id, cookie)
      user = User.find(id) if id
      (user && user.uid == cookie) ? user : nil
    end

    def cookie
      uid
    end
  end
end
