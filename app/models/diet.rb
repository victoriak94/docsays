class Diet < ApplicationRecord
  belongs_to :diagnosis
  has_one(:patient, {:through => :diagnosis})

  pg_search_scope :search_by_term, against: [:title, :content],
  using: {
    tsearch: {
      any_word: true,
      prefix: true
    }
  }

  validates :name, presence: true
end
