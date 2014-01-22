class DashboardsController < ApplicationController
  def show
    @current_user = current_user
    @shouts = @current_user.shouts
    @shout = Shout.new
  end
end
