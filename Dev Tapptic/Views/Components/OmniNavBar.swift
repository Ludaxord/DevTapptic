//
//  DevTappticNavBar.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit

class DevTappticNavBar: UINavigationBar {
    
    var navBarItem: UINavigationItem
    
    init(defaultBar: Bool, frame: CGRect?, screen: CGRect = UIScreen.main.bounds) {
        navBarItem = UINavigationItem(title: "\(Statics.devTappticKey)")
        let navBarFrame: CGRect = CGRect(x: 0, y: 0, width: screen.width, height: 60)
        if defaultBar {
            super.init(frame: navBarFrame)
        } else {
            if frame != nil {
                super.init(frame: frame!)
            } else {
                fatalError("CGRect for frame must be provided")
            }
        }
    }
    
    init(defaultBar: Bool, frame: CGRect?, screen: CGRect = UIScreen.main.bounds, navButtons: [UIBarButtonItem]) {
        navBarItem = UINavigationItem(title: "\(Statics.devTappticKey)")
        let navBarFrame: CGRect = CGRect(x: 0, y: 0, width: screen.width, height: 60)
        if defaultBar {
            super.init(frame: navBarFrame)
        } else {
            if frame != nil {
                super.init(frame: frame!)
            } else {
                fatalError("CGRect for frame must be provided")
            }
        }
        initDefaultItems(navButtons: navButtons)
    }
    
    func initDefaultItems(navButtons: [UIBarButtonItem?]) {
        if navButtons.count > 2 {
            fatalError("Overloaded Array only two elements available")
        } else {
            navBarItem.rightBarButtonItem = navButtons[0]!
            navBarItem.leftBarButtonItem = navButtons[1]!
        }
        self.setItems([navBarItem], animated: true)
    }
    
    func addNewItem(from: Int, item: UIBarButtonItem) {
        if from == 0 {
            navBarItem.rightBarButtonItem = item
        } else if from == 1 {
            navBarItem.leftBarButtonItem = item
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
