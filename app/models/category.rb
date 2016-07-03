class Category < ActiveRecord::Base
  # Validating data #
  validates :title, presence: true
  validates :description, presence: true
end
