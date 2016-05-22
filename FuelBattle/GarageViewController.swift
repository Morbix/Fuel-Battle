//
//  GarageViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager

class GarageViewController: UITableViewController {

    lazy var tableManager: TableManager = TableManager(tableView: self.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupCells()
        setupTable()
    }

    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.garage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(GarageViewController.addTouched))
    }
    
    final private func setupCells() {
        // tableView.registerNib(R.nib.cellInformation)
    }
    
    final private func setupTable() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = defaultEstimatedRowHeight
        tableView.separatorStyle = .None
    }
    
    // MARK: Actions
    
    final func addTouched() {
        
    }
    
}
