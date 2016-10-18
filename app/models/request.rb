class Request < ApplicationRecord

  ## Association
  belongs_to :instructor

  ## Validations
  validates :name, presence: true, length: { in:3..20 }
  validates :email, presence: true, format: { with:/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, length: { in:3..55 }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in:11..15 }
  validates :message, length: { maximum:250 }
  validates :instructor_id, presence: true, numericality: true
end
