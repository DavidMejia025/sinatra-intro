class Entry < ActiveRecord::Base
  # Remember to create a migration!
  # has_many :publications, { :class_name => "Publication", :foreign_key => :entry_id }
  has_many :publications
  # has_many :publications
  has_many :tags, through: :publications
end
