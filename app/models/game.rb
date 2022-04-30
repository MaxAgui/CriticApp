class Game < ApplicationRecord
  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies

  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres

  has_many :expansions, class_name: "Game",
                        foreign_key: "parent_id",
                        dependent: :destroy,
                        inverse_of: "parent"

  belongs_to :parent, class_name: "Game", optional: true

  has_many :critics, as: :criticable, dependent: :destroy
  has_one_attached :cover

  enum category: { main_game: 0, expansion: 1 }

  validates :category, presence: true
  validates :name, uniqueness: true, presence: true
  validates :rating,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100,
              allow_nil: true
            }
  validate :validate_parent

  private

  def validate_parent
    if category == "main_game" && parent_id
      errors.add(:parent_id, "Should be null")
    elsif category == "expansion" && Game.find_by(id: parent_id).nil?
      errors.add(:parent_id, "Should be a valid game id")
    end
  end
end
