class UploadsController < ApplicationController
  def new
  end

  def create
    filename = "tmp/uploads/#{Time.now.to_f}.#{params[:Filename]}"
    if Tempfile === params[:Filedata]
      FileUtils.mv(params[:Filedata].path, filename)
    else
      File.open(filename, 'w') do |f|
        f.write(params[:Filedata].read)
      end
    end
    render :text => filename
    GC.start
  end
end
