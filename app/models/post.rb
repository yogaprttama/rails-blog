class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 3 }
  validates :status, acceptance: { accept: ['DRAFT', 'PUBLISHED'] }

  after_validation :set_post_slug, only: [:create, :update]

  belongs_to :user, foreign_key: 'post_author'
  scope :recent, -> { where(status: "PUBLISHED").order(created_at: :desc) }

  private

    def set_post_slug
      self.slug = title.parameterize
    end
end
