class Critic < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true

  validates :body, presence: true
  # validates :title, presence: true, length: { maximun: 40 }
end
