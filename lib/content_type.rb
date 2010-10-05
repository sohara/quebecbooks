def content_type(file)
  type = (file.path.match(/\.(\w+)$/)[1] rescue "octet-stream").downcase
  case type
  when %r"jpe?g"                 then "image/jpeg"
  when %r"tiff?"                 then "image/tiff"
  when %r"png", "gif", "bmp"     then "image/#{type}"
  when "txt"                     then "text/plain"
  when %r"html?"                 then "text/html"
  when "csv", "xml", "css", "js" then "text/#{type}"
  else "application/x-#{type}"
  end
end