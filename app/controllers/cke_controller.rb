class CkeController < ApplicationController
  def index
  end

  def upload
  end

  def view
    basename = File.basename(params[:filename])
    filename = File.expand_path(File.join(File.dirname(__FILE__), '../../files', basename))
    if File.file?(filename)
      send_file filename, disposition: 'inline'
    else
      render :text => 'File Not Found', status: :not_found
    end
  end

  def browse
  end
end
