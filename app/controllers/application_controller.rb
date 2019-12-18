class ApplicationController < ActionController::API
  include Pagy::Backend
  include Pundit
end
