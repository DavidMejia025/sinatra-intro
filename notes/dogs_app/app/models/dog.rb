class Dog < ActiveRecord::Base
    validates :name, :age, presence: true
    validates :age, numericality: {greater_than_or_equal_to: 0}
end
