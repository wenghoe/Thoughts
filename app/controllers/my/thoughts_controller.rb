class My::ThoughtsController < ApplicationController
  before_action :prepare_new_thought, :only => :index
  before_action :prepare_thought, :only => [:hide, :edit, :update]

  def index
    @thoughts = current_user.thoughts
  end

  def create
    @thought = current_user.thoughts.build(params_thought)
    if @thought.save
      flash[:success] = "Thought created"
      redirect_to action: :index
    else
      flash[:error] = "Could not create thought"
      redirect_to action: :index
    end
  end

  def hide
    @thought.visible = false
    @thought.save
    flash[:success] = "Thought removed"
    redirect_to action: :index
  end

  def edit
  end

  def update
    if @thought.update(params_thought)
      flash[:success] = "Thought updated"
      redirect_to action: :index
    else
      flash[:error] = @thought.errors.full_messages
      render :edit
    end


  end

  private
  def prepare_new_thought
    @thought = current_user.thoughts.build
  end

  def prepare_thought
    @thought = current_user.thoughts.find(params[:id])
  end

  def params_thought
    params.require(:thought).permit(:content, :visible)
  end

end
