class UploadsController < ApplicationController
  def new
  end

  def create
    File.open("tmp/uploads/#{params[:Filename]}", 'w') do |f|
      f.write(params[:Filedata].read)
    end
    render :nothing => true
  end
end
