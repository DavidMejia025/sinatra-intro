class Dog < ActiveRecord::Base
  validates :name, :age, presence: true
  belongs_to :owner
end
