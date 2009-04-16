ActionView::Helpers::FormHelper.class_eval do
  def background_file_tag
    content_tag(:div, "", :class => "yuppie-uploader-button") +
    content_tag(:div, 
      content_tag(:div, "", :class => "yuppie-statusbar") +
      content_tag(:span, "megaman-sprite.png  <b>50%</b>", :class => "yuppie-current-filename"),
      :class => "yuppie-statusbar-container")
  end
end
