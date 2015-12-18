class CkeController < ApplicationController
  layout false, only: [:upload, :browse]

  def index
  end

  def upload
    basename = File.basename(params[:upload].original_filename)
    # if invalid image file
      # TODO: validate image file
      # @uploaded = 0
      # @message = "Invalid file extension."
    # else
      # if File.file?(filename)
        # TODO: rename if already exists
        # basename = ...
        # @message = 'A file with the same name already exists. The uploaded file was renamed to "...".'
      # end
      filename = File.expand_path(Rails.root.join('files', basename))
      File.open(Rails.root.join('files', basename), 'wb') do |file|
        file.write(params[:upload].read)
      end
      @uploaded = 1
      @filename = basename
      @url = view_path(basename)
    # end
    if params[:responseType] == 'json'
      render formats: :json
    end
  end

  def view
    basename = File.basename(params[:filename])
    filename = File.expand_path(Rails.root.join('files', basename))
    if File.file?(filename)
      send_file filename, disposition: 'inline'
    else
      render :text => 'File Not Found', status: :not_found
    end
  end

  def browse
  end
end
