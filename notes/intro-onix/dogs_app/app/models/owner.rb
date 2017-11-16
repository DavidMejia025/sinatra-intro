class Owner < ActiveRecord::Base
  # Remember to create a migration!
  has_many :dogs

  def dogs

  end
end

