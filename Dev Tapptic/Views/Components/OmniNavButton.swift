//
//  DevTappticNavButton.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit

class DevTappticNavButton: UIBarButtonItem {
    
    var devTappticWidth: CGFloat
    var devTappticHeight: CGFloat
    var devTappticColor: UIColor
    var devTappticText: String
    var button: UIButton
    var buttonView: UIView
    var _image: UIImage?
    
    init(defaultButton: Bool, width: CGFloat, height: CGFloat, color: UIColor, text: String = "", image: UIImage?) {
        devTappticHeight = height
        devTappticWidth = width
        devTappticColor = color
        devTappticText = text
        button = UIButton.init(type: .system)
        _image = image
        let viewSize: CGRect = CGRect(x: 0, y: 0, width: devTappticWidth, height: devTappticHeight)
        buttonView = UIView.init(frame: viewSize)
        super.init()
        if defaultButton {
            initCustomBarButton()
        } else {
            if _image != nil {
                initViewWithImage()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeText(newText: String) {
        button.setTitle(newText, for: .normal)
    }
    
    func initViewWithImage() {
        button.backgroundColor = .clear
        button.frame = buttonView.frame
        button.setImage(_image, for: .normal)
        button.autoresizesSubviews = true
        button.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        buttonView.backgroundColor = devTappticColor
        buttonView.addSubview(button)
        self.customView = buttonView
    }
    
    func initCustomBarButton() {
        button.backgroundColor = .clear
        button.frame = buttonView.frame
        button.setTitle(devTappticText, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.tintColor = .white
        button.autoresizesSubviews = true
        button.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        buttonView.backgroundColor = devTappticColor
        buttonView.layer.cornerRadius = 10
        buttonView.addSubview(button)
        self.customView = buttonView
    }
    
}
