//
//  EditCarViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit

class EditCarViewController: UITableViewController {
    
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
        showAlert(withMessage: R.string.localizable.notImplementedYet())
    }
    
    final func cancelTouched() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
