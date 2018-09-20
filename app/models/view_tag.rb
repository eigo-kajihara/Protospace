class ViewTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype
end
