//
//  CellAddNew.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager

class CellAddNew: UITableViewCell {

    @IBOutlet weak var buttonTitle: UIButton!
    
    static func newRow(withContent content: String, didSelectBlock: DidSelectRowAtIndexPath? = nil) -> Row {
        
        let block: ConfigureCellBlock = { (object, cell, indexPath) in
            if let cell = cell as? CellAddNew {
                cell.buttonTitle.setTitle(content, forState: .Normal)
            }
        }
        
        let row = Row(identifier: R.reuseIdentifier.cellAddNew.identifier, object: nil, configureCell: block)
        row.didSelectRowAtIndexPath = didSelectBlock
        return row
    }
    
}
