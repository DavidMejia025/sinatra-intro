class Cat < ActiveRecord::Base
  validates :age, :name, presence: true
  validates :age, numericality: { greater_than: 0 }
end
