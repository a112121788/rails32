class HelloController < ApplicationController
  def index
    @remote_ip = request.remote_ip
  end
end
