if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = {:exe_path => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s}
else
  WickedPdf.config = { :exe_path => '/usr/local/bin/wkhtmltopdf'}
end
