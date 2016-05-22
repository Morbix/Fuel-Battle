//
//  CellLine.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 26/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit
import TableManager

class CellLine: UITableViewCell {
    
    @IBOutlet weak var lineView: UIView!

    static func newRow() -> Row {
        return Row(identifier: R.reuseIdentifier.cellLine.identifier, object: nil, configureCell: nil)
    }
    
    static func newRow(withColor color: UIColor) -> Row {
        let block: ConfigureCellBlock = { (object, cell, indexPath) in
            if let cell = cell as? CellLine {
                cell.lineView.backgroundColor = color
            }
        }
        
        return Row(identifier: R.reuseIdentifier.cellLine.identifier, object: nil, configureCell: block)
    }
    
}
