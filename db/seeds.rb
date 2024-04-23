# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#DBの初期化：rails db:reset
category_names = ["食費", "外食費", "生活用品", "生活家電", "生活家具", "家賃", "水道代", "電気代", "ガス代","Wifi代"]

category_records = category_names.map.with_index do |name, i|
    Category.create("id": i+1, "name": name )
end  
