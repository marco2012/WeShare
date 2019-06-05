//
//  Book.swift
//  FriendlyEats
//
//  Created by Marco on 01/11/2018.
//  Copyright © 2018 Firebase. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    
    var name:String
    var category: String
    var item_description:String
    var rating:Double
    var image_link:String
    var address: String?;
    var latitude: Double?;
    var longitude: Double?;
    var seller: String?;
    var price: Double?;
    var author_phone: Int?;
    
    init(name: String, category: String, item_description: String, rating: Double, image_link: String, address: String?, latitude: Double?, longitude: Double?, seller:String?, price:Double?, author_phone:Int?) {
        self.name = name
        self.category = category
        self.item_description = item_description
        self.rating = rating == 0.0 ? Double.random(in: 2.0 ..< 5.0) : rating   //if rating from API is 0 choose random number
        self.image_link = image_link
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.seller = seller
        self.price = price
        self.author_phone = author_phone
    }
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "category": category,
            "item_description": item_description,
            "rating": rating,
            "image_link": image_link,
            "address": address ?? "",
            "latitude" : latitude ?? 0.0,
            "longitude": longitude ?? 0.0,
            "seller" : seller!,
            "price" : price!,
            "author_phone" : author_phone ?? 0.0
        ]
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let category = aDecoder.decodeObject(forKey: "category") as? String
        let item_description = aDecoder.decodeObject(forKey: "item_description") as? String
        let rating = aDecoder.decodeObject(forKey: "rating") as? Double ?? Double.random(in: 1.0 ..< 5.0)
        let image_link = aDecoder.decodeObject(forKey: "image_link") as? String
        let address = aDecoder.decodeObject(forKey: "address") as? String
        let latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
        let longitude = aDecoder.decodeObject(forKey: "longitude") as? Double
        let seller = aDecoder.decodeObject(forKey: "seller") as? String
        let price = aDecoder.decodeObject(forKey: "price") as? Double
        let author_phone = aDecoder.decodeObject(forKey: "author_phone") as? Int
        self.init(
                  name: name!,
                  category: category!,
                  item_description: item_description!,
                  rating: rating,
                  image_link: image_link!,
                  address: address,
                  latitude : latitude,
                  longitude: longitude,
                  seller: seller,
                  price: price,
                  author_phone: author_phone
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(category, forKey: "category")
        aCoder.encode(item_description, forKey: "item_description")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(image_link, forKey: "image_link")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(seller, forKey: "seller")
        aCoder.encode(seller, forKey: "price")
        aCoder.encode(seller, forKey: "author_phone")
    }
        
    convenience init?(dictionary: [String : Any]) {
            guard let name = dictionary["name"] as? String,
            let category = dictionary["category"] as? String,
            let item_description = dictionary["item_description"] as? String,
            let rating = dictionary["rating"] as? Double,
            let image_link = dictionary["image_link"] as? String,
            let address = dictionary["address"] as? String,
            let latitude = dictionary["latitude"] as? Double,
            let longitude = dictionary["longitude"] as? Double,
            let seller = dictionary["seller"] as? String,
            let price = dictionary["price"] as? Double,
            let author_phone = dictionary["author_phone"] as? Int
            else { return nil }
        
        
        self.init(
                  name: name,
                  category: category,
                  item_description: item_description,
                  rating: rating,
                  image_link: image_link,
                  address: address,
                  latitude : latitude,
                  longitude: longitude,
                  seller: seller,
                  price:price,
                  author_phone:author_phone
        )
    }
    
}


