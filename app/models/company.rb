class Company < ApplicationRecord
  has_many :critics, as: :criticable, dependent: :destroy
end
