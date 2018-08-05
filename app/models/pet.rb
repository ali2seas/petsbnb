class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :size, presence: true
  mount_uploader :photo, PhotoUploader

  def self.next(pet)
   where("id > ?", pet.id).first
  end

  def self.prev(pet)
    where("id < ?", pet.id).last
  end
end
