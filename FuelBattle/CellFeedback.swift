//
//  CellError.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 12/05/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit
import TableManager

class CellFeedback: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static func newRow(withText text: String, block didSelectBlock: DidSelectRowAtIndexPath? = nil) -> Row {
        let block: ConfigureCellBlock = { (object, cell, indexPath) in
            if let cell = cell as? CellFeedback {
                cell.descriptionLabel.text = text
            }
        }
        
        let row = Row(identifier: R.reuseIdentifier.cellFeedback.identifier, object: nil, configureCell: block)
        row.didSelectRowAtIndexPath = didSelectBlock
        return row
    }
    
    static func newEmptyFeedbackRow(block didSelectBlock: DidSelectRowAtIndexPath? = nil) -> Row {
        return CellFeedback.newRow(withText: R.string.localizable.noDataFound())
    }
    
    static func newErrorFeedbackRow(block didSelectBlock: DidSelectRowAtIndexPath? = nil) -> Row {
        return CellFeedback.newRow(withText: R.string.localizable.couldNotLoadData())
    }
    
}
