module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?, :new_user?
    helper_method :admin?, :speaker?
  end

  # If user already logged in by omniauth, set session information to @current_user
  # If user doesn't logged in, redirect to login page
  def logged_in_using_omniauth?
    puts "logged_in_using_omniauth?"
    if session[:userinfo].present?
      puts "user present"
      @current_user = session[:userinfo]
    else
      redirect_to "/#{params[:event]}"
    end
  end

  def new_user?
    puts "new_user?"
    puts "session[:userinfo]  #{session[:userinfo]}"
    puts "@current_user: #{@current_user}"
    if session[:userinfo].present? && !Profile.find_by(email: @current_user[:info][:email])
      puts "user is present and profile isn't exists"
      unless ["profiles"].include?(controller_name)
        puts "refirect registration"
        redirect_to "/#{params[:event]}/registration"
      end
    end
  end

  def admin?
    @current_user[:extra][:raw_info]["https://cloudnativedays.jp/roles"].include?("CNDT2020-Admin")
  end

  def speaker?
    @current_user[:extra][:raw_info]["https://cloudnativedays.jp/roles"].include?("CNDT2020-Speaker")
  end

  def is_admin?
    # respond_to do |format|
    #   format.html { redirect_to controller: "track", action: "show", id: 1 }
    #   format.json { render json: "Forbidden", status: :forbidden }
    # end
  end
end

