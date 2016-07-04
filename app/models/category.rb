class Category < ActiveRecord::Base
  # Validating data #
  validates :title, presence: true
  validates :description, presence: true

  # Friendly links #
  extend FriendlyId
  friendly_id :title, use: :slugged
end
