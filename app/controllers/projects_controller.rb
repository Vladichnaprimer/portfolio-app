class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @project = Project.all.order('created_at ASC').paginate(page: params[:page], per_page: 4)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: 'Nice! That project was successfully created!'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to @project, notice: 'Nice! That project was successfully saved!'
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path


  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :link)
    end
    def find_project
      @project = Project.find(params[:id])
    end
end
