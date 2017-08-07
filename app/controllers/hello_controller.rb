class HelloController < ApplicationController
  def index
    @user = User.last
  end
end
