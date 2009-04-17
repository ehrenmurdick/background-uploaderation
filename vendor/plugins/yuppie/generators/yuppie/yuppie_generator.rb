class YuppieGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory "tmp/yuppie_uploads"
      m.file 'yuppie_uploads_controller.rb', "app/controllers/yuppie_uploads_controller.rb"

      m.file "javascripts/element-min.js", "public/javascripts/element-min.js"
      m.file "javascripts/uploader-min.js", "public/javascripts/uploader-min.js"    
      m.file "javascripts/yahoo-dom-event.js", "public/javascripts/yahoo-dom-event.js" 
      m.file 'javascripts/yuppie.js', 'public/javascripts/yuppie.js'

      m.file 'stylesheets/yuppie.css', 'public/stylesheets/yuppie.css'
      m.file 'images/button.jpg', 'public/images/button.jpg'

      m.directory 'public/swf'
      m.file 'swf/uploader.swf', 'public/swf/uploader.swf'

      m.file 'yuppie_upload.rb', 'app/models/yuppie_upload.rb'
      m.migration_template 'migrate/create_yuppie_uploads.rb', 'db/migrate'

      m.readme "INSTALL"
    end
  end

  def file_name
    "create_yuppie_uploads"
  end
end
