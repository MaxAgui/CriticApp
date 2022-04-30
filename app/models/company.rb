class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :critics, as: :criticable, dependent: :destroy

  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies
  has_one_attached :cover
end
