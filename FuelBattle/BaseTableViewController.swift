//
//  BaseTableViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager


class BaseTableViewController: UITableViewController {

    lazy var tableManager: TableManager = TableManager(tableView: self.tableView)
    lazy var defaultSection = Section()
    var useDefaultSection = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCells()
        setupTable()
    }

    final private func setupCells() {
        tableView.registerNib(R.nib.cellAddNew)
        tableView.registerNib(R.nib.cellFeedback)
        tableView.registerNib(R.nib.cellSpace)
        tableView.registerNib(R.nib.cellLine)
    }
    
    final private func setupTable() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = defaultEstimatedRowHeight
        tableView.separatorStyle = .SingleLine
        
        if useDefaultSection {
            tableManager.sections.append(defaultSection)
        }
    }
    
}
