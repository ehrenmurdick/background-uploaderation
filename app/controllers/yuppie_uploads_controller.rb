class YuppieUploadsController < ApplicationController
  UPLOADS_DIRECTORY = File.join("tmp", "yuppie_uploads")
  def create
    filename = save_data(params[:Filename], params[:Filedata])
    upload = YuppieUpload.new(:file_path => filename)
    if upload.save
      render :text => upload.id
    else
      #  :(   sad path
    end
    GC.start
  end

  private
  def save_data(filename, data)
    filename = File.join(UPLOADS_DIRECTORY, "#{Time.now.to_f}.#{filename}")
    if Tempfile === data
      FileUtils.mv(data.path, filename)
    else
      File.open(filename, 'w') do |f|
        f.write(data.read)
      end
    end
    filename
  end
end
