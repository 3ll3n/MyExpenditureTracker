require("pry-byebug")
require_relative("../models/Merchant")

merchant1 = Merchant.new({"name" => "Tesco"})
merchant2 = Merchant.new({"name" => "Scottish Power"})
merchant3 = Merchant.new({"name" => "Glasgow City Council"})
merchant4 = Merchant.new({"name" => "Bank of Scotland"})

merchant1.save
merchant2.save
merchant3.save
merchant4.save

binding.pry

nil