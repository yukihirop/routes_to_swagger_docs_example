class AcccessDenied < Sinatra::Base
  enable :raise_errors
  disable :show_exceptinons

  get '/_images/securocat.png' do
    send_file(File.expand_path("../../assets/images/securocat.png", __FILE__))
  end
end