class PodcastInvitation < ApplicationRecord
  belongs_to :podcast
  belongs_to :guest
end
