//
//  Products.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

struct Product {
    var id: String
    var name: String
    var categories: [String]
    var seller: String
    var point: Double
    var price: Double
    var comment: [String]
    init(id: String, name: String, categories: [String], seller: String, point: Double, price: Double, comment: [String]) {
        self.id = id
        self.name = name
        self.categories = categories
        self.seller = seller
        self.point = point
        self.price = price
        self.comment = comment
    }
}
