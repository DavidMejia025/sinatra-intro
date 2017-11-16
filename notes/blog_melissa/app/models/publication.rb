class Publication < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tag
  belongs_to :entry
  # has_many :entries
end
