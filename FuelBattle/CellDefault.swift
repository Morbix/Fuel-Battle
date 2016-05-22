//
//  CellDefault.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager

class CellDefault: UITableViewCell {

    static func newRow(withText text: String, detail: String, block didSelectBlock: DidSelectRowAtIndexPath? = nil) -> Row {
        let block: ConfigureCellBlock = { (object, cell, indexPath) in
            if let cell = cell as? CellDefault {
                cell.textLabel?.text = text
                cell.detailTextLabel?.text = detail
            }
        }
        
        let row = Row(identifier: R.reuseIdentifier.cellDefault.identifier, object: nil, configureCell: block)
        row.didSelectRowAtIndexPath = didSelectBlock
        return row
    }
}
