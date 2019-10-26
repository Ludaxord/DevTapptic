//
//  UIBarButtonItemExtension.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 13/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
