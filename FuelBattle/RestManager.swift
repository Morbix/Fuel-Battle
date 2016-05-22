//
//  RestManager.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import Foundation
import Firebase

struct GetObjectsCompletion<T> {
    let block: (objects: [T], error: NSError?) -> ()
}

struct GetObjectCompletion<T> {
    let block: (object: T?, error: NSError?) -> ()
}

struct SaveObjectCompletion {
    let block: (error: NSError?) -> ()
}

struct Rest {
    
    static func saveCar(car: Car, withCompletion completion: SaveObjectCompletion) {
        guard let user = FIRAuth.auth()?.currentUser else {
            completion.block(error: defaultErrorShouldBeLogged)
            return
        }
        
        let parameters = ["brand": car.brand, "model": car.model, "year": car.year, "fuel": car.fuel]
        
        let ref = FIRDatabase.database().reference()
        ref.child("car/\(user.uid)").childByAutoId().setValue(parameters) { (error, ref) in
            completion.block(error: error)
        }
    }
    
    static func retrieveAllCars(withCompletion completion: GetObjectsCompletion<Car>) {
        guard let user = FIRAuth.auth()?.currentUser else {
            completion.block(objects: [], error: defaultErrorShouldBeLogged)
            return
        }
        
        let ref = FIRDatabase.database().reference()
        ref.child("car/\(user.uid)").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            guard let snapshotValue = snapshot.value as? [String: AnyObject] else {
                completion.block(objects: [], error: defaultErrorUnexpected)
                return
                
            }
            
            let objects:[Car] = snapshotValue.enumerate().flatMap {
                if let item = $0.element.1 as? [String: AnyObject] {
                    return Car(withDictionary: item)
                }
                return nil
            }
            
            completion.block(objects: objects ,error: nil)
        }) { (error) in
            completion.block(objects: [], error: error)
        }
    }
    
}
