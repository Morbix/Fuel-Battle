//
//  TabBarViewController.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 20/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import UIKit
import CoreImage

private struct Item {
    var title: String
    var image: UIImage
    var selectedImage: UIImage
    var viewController: UIViewController
}

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = R.color.fuelBattle.gray.color()
        tabBar.barTintColor = R.color.fuelBattle.grayLight.color()
        tabBar.translucent = false
        
        let items = [
            Item(title: R.string.localizable.averages(), image: imageForTab(R.image.battleGray()), selectedImage: imageForTab(R.image.battleOrange()), viewController: averagesScreen()),
            Item(title: R.string.localizable.garage(), image: imageForTab(R.image.carGray()), selectedImage: imageForTab(R.image.carOrange()), viewController: garageScreen()),
        ]
        
        self.setViewControllers(items.map { $0.viewController }, animated: false)
        
        if let tabs = tabBar.items where tabs.count == items.count {
            
            for (index, tab) in tabs.enumerate() {
                tab.title = items[index].title
                tab.image = items[index].image
                tab.selectedImage = items[index].selectedImage
            }
        }
    }
    
    // MARK: Methods
    
    final private func imageForTab(image: UIImage?) -> UIImage {
        guard let image = image else {
            return UIImage()
        }
        
        return image.imageWithRenderingMode(.AlwaysOriginal)
    }
    
    final private func averagesScreen() -> UIViewController {
        return BaseNavigationViewController(rootViewController: AveragesViewController())
    }
    
    final private func garageScreen() -> UIViewController {
        return BaseNavigationViewController(rootViewController: GarageViewController())
    }
    
}
