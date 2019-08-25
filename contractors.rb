#!/usr/bin/env ruby
require File.expand_path('../config/boot',  __FILE__)
require File.expand_path('../config/environment',  __FILE__)
require 'nokogiri'
require 'csv'
require 'json'
# CSV.read('contractors.csv').each { |row|
#   unless row[9].nil?
#     contractor = Contractor.find_by(telephone: row[9])
#     unless contractor.nil?
#       puts row[9]
#       CSV.open("matched.csv", "a+") do |csv|
#         csv << row.unshift(contractor.id)
#       end
#     end
#   end
# }
matched = []
CSV.read('matched.csv').each { |row| matched << row[10] }
CSV.read('checked.csv').each { |row| matched << row[9] }


CSV.read('contractors.csv').each { |row|
  contractor = nil
  unless matched.include?(row[9])

    contractor = Contractor.find_by(website: row[2]) unless row[2].nil?

    if !row[5].nil? && contractor.nil?
      results = Geocoder.search(row[5])
      coords = results.first.coordinates
      lat  = coords[0]
      long = coords[1]
      contractor = Contractor.where(latitude: lat, longitude: long).first
    end

    unless contractor.nil?
      puts "#{row[9]} - #{row[8]}"
      CSV.open("matched.csv", "a+") { |csv| csv << row.unshift(contractor.id) }
      contractor.update(email: row[8]) unless row[8].nil?
    end

    CSV.open("checked.csv", "a+") { |csv| csv << row }

  end
}

