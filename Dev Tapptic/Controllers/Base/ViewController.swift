//
//  ViewController.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 11/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var devTapptic: DevTapptic
    var uiPreferences: UIPreferences
    
    var devTappticNavBar: DevTappticNavBar
    
    init(_devTapptic: DevTapptic, _uiPreferences: UIPreferences) {
        devTapptic = _devTapptic
        uiPreferences = _uiPreferences
        let rightButton = DevTappticNavButton(defaultButton: true, width: 100, height: 30, color: UIColor(white: 1, alpha: 0), image: nil)
        let leftButton = DevTappticNavButton(defaultButton: true, width: 100, height: 30, color: UIColor(white: 1, alpha: 0), image: nil)
        devTappticNavBar = DevTappticNavBar(defaultBar: true, frame: nil, navButtons: [rightButton, leftButton])
        super.init(nibName: nil, bundle: nil)
        initBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBaseView() {
        view.backgroundColor = .white
        initNavBar(withDefaultConstraints: true)
    }
    
    func initNavBar(withDefaultConstraints: Bool) {
        let rootView: UIView = self.view
        self.view.addSubview(devTappticNavBar)
        devTappticNavBar.snp.makeConstraints { make -> Void in
            make.height.equalTo(120)
            make.width.equalTo(uiPreferences.getScreenSize().width)
            make.top.equalTo(rootView.snp.top).offset(40)
            make.left.equalTo(rootView.snp.left)
            make.right.equalTo(rootView.snp.right)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

