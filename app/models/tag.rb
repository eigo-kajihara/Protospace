class Tag < ActiveRecord::Base
	has_many :prototype
	has_many :tags, through: :view_tags

	accepts_nested_attributes_for :view_tags

end
