class My::ThoughtsController < ApplicationController
  before_action :prepare_thought, :only => :index

  def index
    @thoughts = current_user.thoughts
  end

  def create
    @thought = current_user.thoughts.build(param_thought)
    if @thought.save
      redirect_to action: :index
    else
      flash.now[:error] = "Could not create thought"
      redirect_to action: :index
    end
  end

  private
  def prepare_thought
    @thought = current_user.thoughts.build
  end

  def param_thought
    params.require(:thought).permit(:content)
  end

end
