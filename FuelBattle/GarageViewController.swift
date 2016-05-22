//
//  GarageViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager

class GarageViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        retrieveData()
    }

    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.garage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(GarageViewController.addTouched))
    }
    
    // MARK: Methodos
    
    final private func retrieveData() {
        defaultSection.rows.removeAll()
        
        defaultSection.rows.append(CellAddNew.newRow(withContent: R.string.localizable.addNewCar(), didSelectBlock: handleAddTouched()))
    }
    
    // MARK: Actions
    
    final func addTouched() {
        presentViewController(EditCarViewController.navigationController(), animated: true, completion: nil)
    }
    
    final private func handleAddTouched() -> DidSelectRowAtIndexPath {
        return { (row: Row, tableView: UITableView, indexPath: NSIndexPath) -> Void in
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            self.addTouched()
        }
    }
    
}
