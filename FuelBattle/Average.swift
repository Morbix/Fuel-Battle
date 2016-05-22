//
//  Average.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import Foundation

struct Average {
    let car: Car
    let average: Int
}

extension Average {
    
    init(withDictionary dictionary: [String: AnyObject]) {
        car = Car(withDictionary: dictionary)
        average = dictionary["average"] as? Int ?? 0
    }
    
}
