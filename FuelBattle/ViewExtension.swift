//
//  ViewExtension.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 13/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    static func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    func fillSuperview() {
        if let view = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(subview)
            view.addConstraint(NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: subview, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: subview, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: view, attribute: .Trailing, relatedBy: .Equal, toItem: subview, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        }
    }
    
}
