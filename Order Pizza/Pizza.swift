//
//  Pizza.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/12/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import Foundation

class Pizza: NSObject {
    var size: String?
    var kindDough: String?
    var kindCheese: String?
    var ingredients = [String: String]()
    
    override init() {
        super.init()
    }
    
    init(size: String, kindDough: String, kindCheese: String) {
        self.size = size
        self.kindDough = kindDough
        self.kindCheese = kindCheese
    }
}
