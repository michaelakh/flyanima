class CityAirportItaCode < ApplicationRecord
  searchkick word_start: [:city, :country]
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      cityAirportItaCode_hash = row.to_hash # exclude the price field
      cityAirportItaCode = CityAirportItaCode.where(id: cityAirportItaCode_hash["id"])

      if cityAirportItaCode.count == 1
        cityAirportItaCode.first.update_attributes(cityAirportItaCode_hash)
      else
        CityAirportItaCode.create!(cityAirportItaCode_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
