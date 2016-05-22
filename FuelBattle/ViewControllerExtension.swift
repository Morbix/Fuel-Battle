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
let defaultErrorShouldBeLogged = NSError(domain: R.string.localizable.youShouldBeLogged(), code: -1, userInfo: nil)
let defaultErrorUnexpected = NSError(domain: R.string.localizable.unexpectedError(), code: -1, userInfo: nil)

extension UIViewController {
    
    final func showAlert(message: String, title: String = R.string.localizable.attention(), okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: okHandler))
        presentViewController(alert, animated: true, completion: nil)
    }
    
}
