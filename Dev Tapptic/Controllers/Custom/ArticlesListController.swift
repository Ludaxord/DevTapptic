//
//  ListController.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit
import SnapKit

class ArticlesListController: ViewController {
    
    var articlesTableView: DevTappticTableView?
    
    var infoLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default on start
        articles()
    }

    
    override func initBaseView() {
        super.initBaseView()
        let rootView: UIView = self.view
        self.articlesTableView = DevTappticTableView(articles: nil, width: self.uiPreferences.getScreenSize().width, height: self.uiPreferences.getScreenSize().height, frame: nil, _devTapptic: devTapptic, _uiPreferences: uiPreferences)
        self.view.addSubview(self.articlesTableView!)
        self.articlesTableView?.articleCell.topicWrapper.isHidden = true
        self.articlesTableView?.articleCell.articleWrapper.isHidden = false
        self.articlesTableView!.snp.makeConstraints { make -> Void in
            let articleTableViewHeight = uiPreferences.getScreenSize().height - devTappticNavBar.bounds.height
            make.height.equalTo(articleTableViewHeight)
            make.width.equalTo(uiPreferences.getScreenSize().width)
            make.top.equalTo(devTappticNavBar.snp.bottom).offset(-70)
            make.left.equalTo(rootView.snp.left)
            make.right.equalTo(rootView.snp.right)
            make.bottom.equalTo(rootView.snp.bottom)
        }
        
        if self.articlesTableView!.isHidden {
            infoLabel = UILabel()
        }
    }
    
    func articles() {
        devTapptic.httpGetArticlesByQuery() { articles, error in
            if articles != nil {
                self.articlesTableView?.refreshTable(articles: articles!)
                self.infoLabel!.isHidden = true
//                self.devTappticSearchNavBarLeftButton.buttonView.isHidden = false
            } else {
                self.infoLabel!.isHidden = false
            }
        }
    }
    
}
