module BannersHelper
  def set_params_type_value
    if @banner.try(:url) and not @banner.url.try('empty?') 
      params[:type] = "external " 
    else 
      params[:type] = "internal"
    end 
  end

  def link_to_banner_type(type, action)
    link_to t(type.to_s), {controller: 'banners', action: action.to_s, type: type.to_s},
      class: "button",
      update: "div_link",
      remote: true
  end

  def links_to_banner_type(type = "internal", action)
    links_hash = {
      'internal' => "<span class='button'>#{t('internal')}</span>#{link_to_banner_type(:external, action)}",
      'external' => "#{link_to_banner_type(:internal, action)}<span class='button'>#{t('external')}</span>"
    }

    raw links_hash[type]
  end
end
