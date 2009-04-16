ActionView::Helpers::FormHelper.class_eval do
  def background_file_tag name, url = "/uploads", method = "post"
    content_tag(:div, 
      content_tag(:div, "", :class => "yuppie-uploader-button") +
      hidden_field_tag("#{name}[uploaded_file_path]") +
      content_tag(:div, 
        content_tag(:div, "", :class => "yuppie-statusbar") +
        content_tag(:span, "", :class => "yuppie-current-filename"),
        :class => "yuppie-statusbar-container", :style => "display:none"),
    :class => "yuppie-container", :id => name.to_s) +
    javascript_tag("new Yuppie($('##{name.to_s}'), '#{url}', '#{method}');")
  end
end
