//
//  StringExtension.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 14/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    func digitsOnly() -> String {
        let stringArray = self.componentsSeparatedByCharactersInSet(
            NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        let newString = stringArray.joinWithSeparator("")
        
        return newString
    }
    
    func openInSafari() -> Bool {
        return openScheme()
    }
    
    func callPhone() -> Bool {
        return openScheme()
    }
    
    func openScheme() -> Bool {
        if let url = NSURL(string: self) {
            if UIApplication.sharedApplication().canOpenURL(url) {
                return UIApplication.sharedApplication().openURL(url)
            }
        }
        
        return false
    }

    func insertStringAtIndex(string: String, index: Int) -> String {
        return  String(self.characters.prefix(index)) + string + String(self.characters.suffix(self.characters.count-index))
    }
    
}
