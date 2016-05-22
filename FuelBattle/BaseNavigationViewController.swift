//
//  BaseNavigationViewController.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 21/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.translucent = false
        navigationBar.barTintColor = R.color.fuelBattle.orange.color()
        navigationBar.tintColor = R.color.fuelBattle.grayLight.color()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: R.color.fuelBattle.grayLight.color()]
    }
    
}
