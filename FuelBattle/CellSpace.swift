//
//  CellSpace.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 14/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit
import TableManager

class CellSpace: UITableViewCell {

    static func newRow() -> Row {
        return Row(identifier: R.reuseIdentifier.cellSpace.identifier, object: nil, configureCell: nil)
    }

}
