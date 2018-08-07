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

  include PgSearch
  pg_search_scope :search_by_name_and_age_category_and_size,
    against: [:name, :age, :category, :size, :address],
    using: {
      tsearch: { prefix: true }
    }

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
