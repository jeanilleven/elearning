class Admin::StaticPagesController < ApplicationController

  before_action :admin_only, only: [ :home ]
  before_action :logged_in_user, only: [ :home ] 

  def home
  end
end
