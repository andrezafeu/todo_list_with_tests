module Api
  class ApiController < ApplicationController
    # to avoid error "can't verify CSRF authenticity"  while doing local tests with curl
    skip_before_filter :verify_authenticity_token
  end
end