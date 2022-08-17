class ApplicationController < ActionController::API
  before_action :ensure_json_request

  def ensure_json_request
    unless request.headers["Accept"] =~ /vnd\.api\+json/
      render body: nil, :status => 406
    end
  end
end
