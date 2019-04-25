class CityAirportItaCode < ApplicationRecord
  searchkick word_start: [:city, :country]
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      cityAirportItaCode_hash = row.to_hash 
      cityAirportItaCode = CityAirportItaCode.where(id: cityAirportItaCode_hash["id"])

      if cityAirportItaCode.count == 1
        cityAirportItaCode.first.update_attributes(cityAirportItaCode_hash)
      else
        CityAirportItaCode.create!(cityAirportItaCode_hash)
      end
    end
  end
end
