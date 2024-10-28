class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy move]

  # GET /tasks
  def index
    @tasks = Task.rank(:row_order).all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: api_v1_task_path(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  # PATCH/PUT /tasks/1/move
  def move
    @task.update(row_order_position: position_params)

    render json: @task
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title)
  end

  def position_params
    params.require(:position)
  end
end
