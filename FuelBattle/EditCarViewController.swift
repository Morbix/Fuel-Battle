//
//  EditCarViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit


class EditCarViewController: UITableViewController {
    
    
    @IBOutlet weak var textFieldBrand: UITextField!
    @IBOutlet weak var textFieldModel: UITextField!
    @IBOutlet weak var textFieldYear: UITextField!
    @IBOutlet weak var textFieldFuel: UITextField!
    
    static func navigationController() -> UINavigationController {
        return R.storyboard.editCar().instantiateInitialViewController() as? UINavigationController ?? UINavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
    }

    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.car()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(EditCarViewController.saveTouched))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(EditCarViewController.cancelTouched))
    }
    
    // MARK: Actions
    
    final func saveTouched() {
        guard let brand = textFieldBrand.text where !brand.isEmpty else {
            showAlert(withMessage: R.string.localizable.allFieldsAreRequired())
            return
        }
        
        guard let model = textFieldModel.text where !brand.isEmpty else {
            showAlert(withMessage: R.string.localizable.allFieldsAreRequired())
            return
        }
        
        guard let year = textFieldYear.text where !brand.isEmpty else {
            showAlert(withMessage: R.string.localizable.allFieldsAreRequired())
            return
        }
        
        guard let fuel = textFieldFuel.text where !brand.isEmpty else {
            showAlert(withMessage: R.string.localizable.allFieldsAreRequired())
            return
        }
        
        let car = Car(brand: brand, model: model, year: year, fuel: fuel)
        
        spinner.show(R.string.localizable.saving(), disableUI: true)
        
        Rest.saveCar(car, withCompletion: SaveObjectCompletion { (error) in
            spinner.hide()
            
            if let _ = error {
                self.showAlert(withMessage: R.string.localizable.couldNotSaveTheObject())
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    
    final func cancelTouched() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
