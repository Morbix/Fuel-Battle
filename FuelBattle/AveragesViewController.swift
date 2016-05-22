//
//  ViewController.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 21/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import TableManager

class AveragesViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        retrieveData(withSpinner: isFirstTime)
    }
    
    // MARK: Setups
    
    final private func setupNavBar() {
        navigationItem.title = R.string.localizable.averages()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(AveragesViewController.addTouched))
    }
    
    // MARK: Methods
    
    final private func retrieveData(withSpinner withSpinner: Bool = false) {
        
        if withSpinner {
            spinner.show(R.string.localizable.loading(), disableUI: true)
        }
        
        Rest.retrieveAllAverages(withCompletion: GetObjectsCompletion<Average> { (objects, error) in
            if withSpinner {
                spinner.hide()
            }
            
            if let _ = error {
                self.loadErrorFeedback()
            } else if objects.count == 0 {
                self.loadEmptyFeedback()
            } else {
                self.displayData(objects)
            }
        })
    }
    
    final private func displayData(objects: [Average]) {
        defaultSection.rows.removeAll()
        
        objects.forEach {
            defaultSection.rows.append(CellDefault.newRow(withText: $0.car.verbose, detail: "\($0.average)"))
        }
        
        tableManager.reloadData()
    }
    
    final override func loadEmptyFeedback() {
        defaultSection.rows.removeAll()
        defaultSection.rows.append(CellAddNew.newRow(withContent: R.string.localizable.beTheFirstToAddAAverage(), didSelectBlock: handleAddTouched()))
        tableManager.reloadData()
    }
    
    // MARK: Actions
    
    final func addTouched() {
        presentViewController(EditAverageViewController.navigationController(), animated: true, completion: nil)
    }
    
    final private func handleAddTouched() -> DidSelectRowAtIndexPath {
        return { (row: Row, tableView: UITableView, indexPath: NSIndexPath) -> Void in
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            self.addTouched()
        }
    }

}
