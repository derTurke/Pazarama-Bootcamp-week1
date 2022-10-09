//
//  User.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

struct User {
    let id: String
    let name: String
    let gender: String
    let age: Int
    let job: String
    init(id: String, name: String, gender: String, age: Int, job: String) {
        self.id = id
        self.name = name
        self.gender = gender
        self.age = age
        self.job = job
    }
}


struct PayInformation {
    var id: String
    var userId: String
    var name: String
    var balance: Double
}

