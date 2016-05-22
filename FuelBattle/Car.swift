//
//  Car.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import Foundation
import Firebase

typealias OperationCompletion = (NSError?) -> Void

struct Car {
    
    let brand: String
    let model: String
    let year: String
    let fuel: String
    
}

extension Car {
    
    func insertInDatabase(withCompletion completion: OperationCompletion? = nil) {
        guard let user = FIRAuth.auth()?.currentUser else {
            completion?(NSError(domain: R.string.localizable.youShouldBeLogged(), code: -1, userInfo: nil))
            return
        }
        
        let parameters = ["brand": brand, "model": model, "year": year, "fuel": fuel]
        
        let ref = FIRDatabase.database().reference()
        ref.child("car/\(user.uid)").childByAutoId().setValue(parameters) { (error, ref) in
            completion?(error)
        }
    }
    
}