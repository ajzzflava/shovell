class StoriesController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  def index
    fetch_stories 'votes_count >= 5'
  end
  def new
    @story = Story.new
  end
  def create
    @story = @current_user.stories.build params[:story]
    if @story.save
      flash[:notice] = 'Story submission succeeded'
      redirect_to stories_path
    else
      render :action => 'new'
    end
  end
  def show
    if params[:id].to_i == 0
      bin
      return true
    end
    @story = Story.find(params[:id])
  end
  def bin
    fetch_stories 'votes_count < 5'
    render :action => 'index'
  end
  protected
  def fetch_stories(conditions)
    @stories = Story.find :all,
    :order => 'id DESC',
    :conditions => conditions
  end
end
