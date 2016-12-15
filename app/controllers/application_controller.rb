class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  # ...
  before_action :prepare_meta_tags, if: "request.get?"

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
end
