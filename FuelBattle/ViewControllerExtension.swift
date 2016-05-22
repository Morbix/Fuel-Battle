//
//  ViewControllerExtension.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 12/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit
import EZLoadingActivity

let spinner = EZLoadingActivity.self
let defaultEstimatedRowHeight: CGFloat = 50.0

extension UIViewController {
    
    final func showAlert(withMessage message: String) {
        showAlert(withTitle: R.string.atencao, message: message)
    }
    
    final func showAlert(withTitle title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
}
