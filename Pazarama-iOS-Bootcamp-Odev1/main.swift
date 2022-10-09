//
//  main.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation
var user = Menu().user

let responseUser = Login().register()
user.append(responseUser)
Menu().menu(user: user[0])
