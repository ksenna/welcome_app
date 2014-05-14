class TasksController < ApplicationController

	def index
		# @tasks = Task.all
		@tasks = Task.incomplete
	end

	def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    	redirect_to tasks_path
    end
  end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
			respond_to do |format|
				format.js
				format.html { redirect_to tasks_path }
			end
		else
			respond_to do |format|
				format.js { render plain: "0" } 
				format.html { redirect_to tasks_path, notice: "Update failed." }
			end
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :completed)
	end

end
