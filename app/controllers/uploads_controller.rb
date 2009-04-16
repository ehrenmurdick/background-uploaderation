class UploadsController < ApplicationController
  def new
  end

  def create
    filename = "tmp/uploads/#{params[:Filename]}"
    %x{cat #{params[:Filedata].path} > #{filename}}
    render :text => filename
  end
end
