class Message < ApplicationRecord
  validates :content, presence: true, allow_blank: false
end
