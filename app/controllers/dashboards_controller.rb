class DashboardsController < ApplicationController
  def show
    @current_user = current_user
    @shouts = @current_user.shouts
    @text_shout = TextShout.new
  end
end
