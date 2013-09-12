class VotesController < ApplicationController
  before_filter :login_required
  def create
    @story = Story.find(params[:story_id])
    Vote.create( :story_id => @story[:id], :user_id => @story[:user_id] )
    respond_to do |format|
      format.js
    end
  end
end
