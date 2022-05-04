class InvolvedCompany < ApplicationRecord
  validates :developer, :publisher, inclusion: { in: [true, false] }
  validates :company, uniqueness: { scope: :game, message: "and Game combination already taken" }
  belongs_to :game
  belongs_to :company, counter_cache: :games_count
end
