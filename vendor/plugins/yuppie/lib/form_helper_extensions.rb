ActionView::Helpers::FormHelper.class_eval do
  def background_file_tag name, url = "/yuppie_uploads", method = "post"
    name = name.to_s
    container_name = "#{name}_container"
    content_tag(:div, 
      content_tag(:div, "", :class => "yuppie-uploader-button") +
      hidden_field_tag(name) +
      content_tag(:div, 
        content_tag(:div, "", :class => "yuppie-statusbar") +
        content_tag(:span, "", :class => "yuppie-current-filename"),
        :class => "yuppie-statusbar-container", :style => "display:none"),
    :class => "yuppie-container", :id => container_name) +
    javascript_tag("new Yuppie($('##{container_name}'), '#{url}', '#{method}');")
  end
end
