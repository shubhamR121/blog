class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  after_commit -> { CommentRelayJob.perform_later(self) }
end
