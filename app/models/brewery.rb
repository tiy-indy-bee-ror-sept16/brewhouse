class Brewery < ApplicationRecord
  include PgSearch

  has_many :beers

  scope :organic, -> { where(is_organic: true) }
  scope :name_starts_with, ->(letters) { where("name ILIKE ?", letters + "%") }
  # pg_search_scope :search_by_name, against: [:name, :website]

  pg_search_scope :search_by_name, :associated_against => {
    :beers => :name
  }, against: :name

  # def self.organic
  #   where(organic: true)
  # end

  def self.verified
    where(status: 'verified')
  end

  # def self.name_starts_with(letters)
  #   where("name ILIKE ?", letters + "%")
  # end

end
