class ErrorsController < ApplicationController
  def not_found
  	binding.pry
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end
end
