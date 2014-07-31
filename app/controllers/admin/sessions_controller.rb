class Admin::SessionsController < ApplicationController
  http_basic_authenticate_with name: Settings.authentication.name, password: Settings.authentication.password, only: [:new]

  def new
    session[:admin] = true
    redirect_to '/admin/jobs'
  end
end