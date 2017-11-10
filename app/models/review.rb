class Review < ActiveRecord::Base
  validates :description, presence: true
  validates_inclusion_of :rating, :in => 1..5

  belongs_to :product
  belongs_to :user
end
