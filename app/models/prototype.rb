class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :view_tags
  has_many :captured_images, dependent: :destroy
  has_many :tags, through: :view_tags

  accepts_nested_attributes_for  :captured_images, reject_if: :reject_sub_images
  accepts_nested_attributes_for  reject_if: :reject_view_tags

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end
end
