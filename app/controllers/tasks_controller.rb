class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update # Pas besoin de view car on n'a pas besoin d'emmener l'utilisateur sur une nouvelle page
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy # Pas besoin de view car on n'a pas besoin d'emmener l'utilisateur sur une nouvelle page -> pas d'autres actions après le destroy finalement
    @task.destroy
    redirect_to tasks_path
  end


  private
    def task_params
      params.require(:task).permit(:title, :details, :completed)
    end

    def set_tasks
      @task = Task.find(params[:id])
    end
end
