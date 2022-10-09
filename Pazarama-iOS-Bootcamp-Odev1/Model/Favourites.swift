//
//  Favourites.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

struct Favourites {
    var userId: String
    var productId: String
    var productName: String
    
    init(userId: String, productId: String, productName: String) {
        self.userId = userId
        self.productId = productId
        self.productName = productName
    }
}
