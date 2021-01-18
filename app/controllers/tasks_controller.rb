class TasksController < ApplicationController
    before_action :find, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def show

    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(get_params)
        if @task.save
            redirect_to tasks_path
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if get_params[:completed].eql?("1")
            get_params[:completed] = true
        else
            get_params[:completed] = false
        end
        if @task.update(get_params)
            redirect_to tasks_path
        else
            render 'edit'
        end
    end

    def destroy
        @task.destroy
        redirect_to tasks_path
    end

    private
    def find
        @task = Task.find(params[:id])
    end

    def get_params
        # if (params[:completed])
        #     params.require(:task).permit(:title, :details, :completed)
        # else
        #     params.require(:task).permit(:title, :details)  
        # end
        params.require(:task).permit(:title, :details, :completed)
    end
end
