class Sprint < ActiveRecord::Base
  has_many :stories
  belongs_to :project
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
