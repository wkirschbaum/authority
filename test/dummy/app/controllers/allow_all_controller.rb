class AllowAllController < ApplicationController
  include Authority::Authorizable

  def index
    render plain: 'ok'
  end
end
