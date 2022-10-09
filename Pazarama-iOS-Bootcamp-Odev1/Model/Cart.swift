//
//  Cart.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

struct Cart {
    let id: String
    let userId: String
    let productName: String
    let price: Double
    init(id: String, userId: String, productName: String, price: Double) {
        self.id = id
        self.userId = userId
        self.productName = productName
        self.price = price
    }
}
