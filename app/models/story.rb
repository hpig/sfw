class Story < ActiveRecord::Base
  belongs_to :sprint
  has_many :tasks
end
