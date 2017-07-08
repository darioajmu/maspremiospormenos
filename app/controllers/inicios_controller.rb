class IniciosController < ApplicationController
  skip_authorize_resource
  skip_authorization_check

  def index
  end
end
