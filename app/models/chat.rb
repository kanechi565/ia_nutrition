class Chat < ApplicationRecord
  belongs_to :objective
  has_many :messages
end
