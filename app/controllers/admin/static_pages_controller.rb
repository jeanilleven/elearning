class Admin::StaticPagesController < ApplicationController

  before_action :admin_only
  before_action :logged_in_user 

  def home
  end
end
