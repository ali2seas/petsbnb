class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :size, presence: true
end
