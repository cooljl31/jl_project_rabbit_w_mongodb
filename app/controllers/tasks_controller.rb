class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :show, :destroy, :update]

  def index
    @tasks = Task.all.order('created_at DESC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def destroy
    redirect_to @tasks if @task.destroy
  end

  private

  def task_params
    params.require(:task).permit([:title, :description, :company, :url])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
