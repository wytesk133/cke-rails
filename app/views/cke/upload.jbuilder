# http://docs.ckeditor.com/#!/guide/dev_file_upload

json.uploaded @uploaded
if @uploaded == 1
  json.fileName @filename
  json.url @url
end
if defined? @message
  json.error do
    json.message @message
  end
end
