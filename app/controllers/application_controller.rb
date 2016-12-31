class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?   
    
  #Devise log in/logout redirect filter
  before_action :store_current_location, :unless => :devise_controller?

  #meta_tags
  before_action :prepare_meta_tags, if: "request.get?"
  

    
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  #meta_tags
  def prepare_meta_tags(options={})
    site_name   = "Tino"
    title       = [controller_name, action_name].join(" ")
    description = "Travel with Pets, take your pets on vacation with Tino"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image, 
      description: description, 
      keywords:    %w[travel pets dogs cats last minute travel ideaes cheap flights hotels train car hire city breaks vacation beach holidays tino],
      twitter: {
        site_name: site_name,
        site: '@tinotravel',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
    
    
  # ...
    
  protected
    
  # Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :date_of_birth, :avatar) }
  end 

  private
    
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end
      
    # override the devise method for where to go after signing out because theirs
    # always goes to the root path. Because devise uses a session variable and
    # the session is destroyed on log out, we need to use request.referrer
    # root_path is there as a backup
    def after_sign_out_path_for(resource)
      request.referrer || root_path
    end
end
