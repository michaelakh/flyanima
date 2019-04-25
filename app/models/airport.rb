class Airport < ApplicationRecord
  searchkick word_start: [:city, :country, :name]
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      airport_hash = row.to_hash 
      airport = Airport.where(id: airport_hash["id"])

      if airport.count == 1
        airport.first.update_attributes(airport_hash)
      else
        Airport.create!(airport_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
    
  # geocoded_by :iata
  # after_validation :geocode
end
