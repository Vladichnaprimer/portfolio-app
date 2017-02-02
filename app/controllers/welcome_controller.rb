class WelcomeController < ApplicationController
  def index
    @project = Project.all.order('created_at ASC').paginate(page: params[:page], per_page: 4)
  end
end
