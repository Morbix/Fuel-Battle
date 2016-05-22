//
//  EditAverageViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit

class EditAverageViewController: UITableViewController {

    static func navigationController() -> UINavigationController {
        return R.storyboard.editAverage().instantiateInitialViewController() as? UINavigationController ?? UINavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.addingNewAverage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(EditAverageViewController.saveTouched))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(EditAverageViewController.cancelTouched))
    }
    
    // MARK: Actions
    
    final func saveTouched() {
        
    }
    
    final func cancelTouched() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
