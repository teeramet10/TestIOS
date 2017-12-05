//
//  UserModel.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/29/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit
class UserModel {
    var id : Int
    var name : String
    var address : String?
    var email : String?
    var age : Int
    var image : String?

    init(id : Int,name : String,age :Int){
        self.id = id
        self.name = name
        self.age = age
    }
}
