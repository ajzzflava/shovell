class Story < ActiveRecord::Base
  after_create :create_initial_vote
  attr_accessible :link, :name, :user_id, :description, :tag_list, :tag_list_on, :tags
  acts_as_taggable
  acts_as_taggable_on :tags

  validates_presence_of :name, :link

  belongs_to :user
  accepts_nested_attributes_for :user

  has_many :votes do
    def latest
      find :all, :order => 'id DESC', :limit => 3
    end
  end
  def to_param
    if name.present?
      "#{id}-#{name.gsub(/\W/, '-').downcase}"
    end
  end
  
  protected
    def create_initial_vote
      votes.create :user_id => user_id, :story_id => id
    end

end
