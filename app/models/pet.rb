class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :size, presence: true
end
