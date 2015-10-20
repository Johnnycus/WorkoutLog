class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :require_user, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @workouts = current_user.workouts.all.order("created_at DESC")
    end
  end

  def show
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def require_user
    if current_user != @workout.user
      redirect_to root_path
    end
  end
end
