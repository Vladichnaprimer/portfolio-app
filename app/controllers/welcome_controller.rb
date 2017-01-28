class WelcomeController < ApplicationController
  def index
    @project = Project.all.order('created_at ASC')
  end
end
