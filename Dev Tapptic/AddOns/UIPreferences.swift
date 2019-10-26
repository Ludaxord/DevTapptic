//
//  UIPreferences.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit

class UIPreferences {
    
    public static let instance = UIPreferences()
    
    func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
}
