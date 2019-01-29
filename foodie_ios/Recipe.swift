//
//  Recipe.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/15/19.
//  Copyright © 2019 dizon. All rights reserved.
//

//single recipe class/struct
import UIKit

class Recipe: NSObject {
    var name: String
    var cuisine: String
    var thumbnail: String
    
    init(name:String, cuisine: String, thumbnail:String){
        self.name = name
        self.cuisine = cuisine
        self.thumbnail = thumbnail
        
        super.init()
    }
}
