class Task < ApplicationRecord
  include RankedModel
  ranks :row_order

  paginates_per 100

  validates :title, presence: true
end
