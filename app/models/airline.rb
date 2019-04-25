class Airline < ApplicationRecord
  searchkick word_start: [:city, :country, :name]
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      airline_hash = row.to_hash 
      airline = Airline.where(id: airline_hash["id"])

      if airline.count == 1
        airline.first.update_attributes(airline_hash)
      else
        Airline.create!(airline_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
