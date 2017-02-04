require("pry-byebug")
require_relative("../models/Merchant")
require_relative("../models/Tag")
require_relative("../models/Transaction")

merchant1 = Merchant.new({"name" => "Tesco"})
merchant2 = Merchant.new({"name" => "Scottish Power"})
merchant3 = Merchant.new({"name" => "Glasgow City Council"})
merchant4 = Merchant.new({"name" => "Bank of Scotland"})

merchant1.save
merchant2.save
merchant3.save
merchant4.save

tag1 = Tag.new({"category" => "shopping"})
tag2 = Tag.new({"category" => "electricity"})
tag3 = Tag.new({"category" => "council tax"})
tag4 = Tag.new({"category" => "mortgage"})

tag1.save
tag2.save
tag3.save
tag4.save

transaction1 = Transaction.new({"merchant_id" => merchant1.id, "tag_id" => tag1.id, "value" => 100.00})
transaction2 = Transaction.new({"merchant_id" => merchant2.id, "tag_id" => tag2.id, "value" => 35.00})
transaction3 = Transaction.new({"merchant_id" => merchant3.id, "tag_id" => tag3.id, "value" => 95.50})
transaction4 = Transaction.new({"merchant_id" => merchant4.id, "tag_id" => tag4.id, "value" => 750.00})

transaction1.save
transaction2.save
transaction3.save
transaction4.save

binding.pry

nil