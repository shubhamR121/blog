class Comment < ApplicationRecord
  belongs_to :article
  after_commit { CommentRelayJob.perform_now(self) }
  belongs_to :user
end