class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # returning the created object as JSON (which is of course defined by the serializer)

  # GET /todos
  def index
    if params[:page]
      page_number = params[:page][:number]
      page_size = params[:page][:size]
    end

    @todos = Todo.page(page_number).per(page_size)

    render json: @todos, includes: 'notes'
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :completed_at)
    end
end
