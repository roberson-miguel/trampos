class HomeController < ApplicationController
  def index
    @users = User.all
    @profiles = Profile.all
  end
end
