//
//  Car.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import Foundation
import Firebase

struct Car {
    
    let brand: String
    let model: String
    let year: String
    let fuel: String
}

extension Car {
    
    init(withDictionary dictionary: [String: AnyObject]) {
        brand = dictionary["brand"] as? String ?? ""
        model = dictionary["model"] as? String ?? ""
        year = dictionary["year"] as? String ?? ""
        fuel = dictionary["fuel"] as? String ?? ""
    }
    
}