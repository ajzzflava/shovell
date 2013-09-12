class Vote < ActiveRecord::Base
  attr_accessible :story_id, :user_id
  belongs_to :story, :counter_cache => true

  belongs_to :user
end
