class TasksController < ApplicationController

	# before_action :load



	# .button= link_to 'Mark Complete', complete_task_path(@task/task - if in a do |task| ), method: :patch    # Looks for complete method

	# def complete
	# 	@task = Task.find(params[:id])
	# 	@task.update_attributes(complete: true)
	#   redirect_to ??
	# end

	# resources: tasks do
	# 	memeber do
	# 		patch :complete
	# 	end
	# end

	# def load
	# 	@tasks = Task.all
	# 	@task = Task.new
	# end



	def index
		 @tasks = Task.all
		 @task = Task.new
		# @tasks = Task.incomplete
	end

  def create
    # @task = Task.new(task_params)
    @task = Task.new(task_params)
    @tasks = Task.all
    @task.save
    respond_to do |format|
    	format.js {}
    	format.html { redirect_to :index }
    end
    # save_task
    # @tasks = Task.all
    # if @task.save
   	# 	render :hide_form
   	# end
    # if @task.save
    	# redirect_to tasks_path
    # end
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	@tasks = Task.all
  end

  def edit
  	@task = Task.find(params[:id])
  	render :show_form
  end

	def update
		# @task = Task.find(params[:id])
		# if @task.update_attributes(task_params)
		# 	respond_to do |format|
		# 		format.js
		# 		format.html { redirect_to tasks_path }
		# 	end
		# else
		# 	respond_to do |format|
		# 		format.js { render plain: "0" } 
		# 		format.html { redirect_to tasks_path, notice: "Update failed." }
		# 	end
		# end
		@task = Task.find(params[:id])
		@task.update_attributes(task_params)
		@tasks = Task.all
		respond_to do |format|
    	format.js {}
    	format.html { redirect_to :index }
    end
		# render :hide_form
		#save_task
	end

	private

	def save_task
		if @task.save 
			# @tasks = Task.all 
			respond_to do |format|
				format.js{ render :hide_form }
			end
		else
			render :show_form
		end
	end

	def task_params
		params.require(:task).permit(:title, :completed)
	end
end