class Instructor < ApplicationRecord
  ## Association
  has_many :requests

  ## To let geocoded use the saved addess to fetch and add latitudes and longitudes attributes
  geocoded_by :address

  ## Google api
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  ## validations
   validates :name, presence: true, length: { in:2..25 }
   validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
   validates :car, length: { maximum:15 }
   validates :address, presence: true, length: { in:6..70 }


  # manual or auto or both needs to be present
  validates :auto, presence: true, unless: -> (instructor){ instructor.manual.present? }
  validates :manual, presence: true, unless: -> (instructor){ instructor.auto.present? }
end
