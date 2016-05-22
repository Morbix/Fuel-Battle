//
//  EditAverageViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit

class EditAverageViewController: UITableViewController {

    @IBOutlet weak var textFieldCar: CarsTextField!
    @IBOutlet weak var textFieldAverage: UITextField!
    
    var newCarScreenOpenned = false
    
    static func navigationController() -> UINavigationController {
        return R.storyboard.editAverage().instantiateInitialViewController() as? UINavigationController ?? UINavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        retrieveData(withSpinner: true)
    }
    
    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.addingNewAverage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(EditAverageViewController.saveTouched))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(EditAverageViewController.cancelTouched))
    }
    
    // MARK: Methods
    
    final private func retrieveData(withSpinner withSpinner: Bool = false) {
        
        if withSpinner {
            spinner.show(R.string.localizable.loading(), disableUI: true)
        }
        
        Rest.retrieveAllCars(withCompletion: GetObjectsCompletion<Car> { (objects, error) in
            if withSpinner {
                spinner.hide()
            }
            
            if let _ = error {
                self.showErrorMessage()
            } else if objects.count == 0 {
                self.showEmptyCarsMessage()
            } else {
                self.textFieldCar.cars.removeAll()
                self.textFieldCar.cars.appendContentsOf(objects)
            }
        })
    }
    
    final private func showErrorMessage() {
        showAlert(R.string.localizable.couldNotLoadData())
        cancelTouched()
    }
    
    final private func showEmptyCarsMessage() {
        if !newCarScreenOpenned {
            newCarScreenOpenned = true
            showAlert(R.string.localizable.youDonTHaveACarPleaseAddOneFirst()) { action in
                self.presentViewController(EditCarViewController.navigationController(), animated: true, completion: nil)
            }
        } else {
            showAlert(R.string.localizable.youStillDonTHaveACar()) { action in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    // MARK: Actions
    
    final func saveTouched() {
        guard let car = textFieldCar.selectedCar else {
            showAlert(R.string.localizable.allFieldsAreRequired())
            return
        }
        
        guard let averageText = textFieldAverage.text, averageInt = Int(averageText) where averageInt > 0 else {
            showAlert(R.string.localizable.allFieldsAreRequired())
            return
        }
        
        let average = Average(car: car, average: averageInt)
        
        spinner.show(R.string.localizable.saving(), disableUI: true)
        
        Rest.saveAverage(average, withCompletion: SaveObjectCompletion { (error) in
            spinner.hide()
            
            if let _ = error {
                self.showAlert(R.string.localizable.couldNotSaveTheObject())
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    
    final func cancelTouched() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
