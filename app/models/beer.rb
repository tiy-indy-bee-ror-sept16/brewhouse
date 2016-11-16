class Beer < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :brewery
end
