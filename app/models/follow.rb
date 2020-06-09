class Follow < ApplicationRecord
  belongs_to :identity
  scope :order_by_streamer_name, -> { order('LOWER(streamer_name)') }
end
