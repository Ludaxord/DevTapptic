//
//  ArticleCell.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit
import SnapKit

class ArticleCell: UITableViewCell {
    
    var articleWrapper: UIView
    var articleTitle: UILabel
    var articleImage: UIImageView
    
    var topicWrapper: UIView
    var topicTitle: UILabel
    
    init(identifier: String) {
        articleWrapper = UIView()
        articleTitle = UILabel()
        articleImage = UIImageView()
        topicWrapper = UIView()
        topicTitle = UILabel()
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        initArticleCell()
        initTopicCell()
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        articleWrapper = UIView()
        articleTitle = UILabel()
        articleImage = UIImageView()
        topicWrapper = UIView()
        topicTitle = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initArticleCell()
        initTopicCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initArticleCell() {
        let rootView = self
        articleWrapper.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        articleTitle.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: 150)
        articleImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: 150)
        self.addSubview(articleWrapper)
        articleWrapper.addSubview(articleImage)
        articleImage.snp.makeConstraints { make -> Void in
            make.height.equalTo(150)
            make.width.equalTo(UIScreen.main.bounds.width / 2)
            make.top.equalTo(rootView.snp.top)
            make.bottom.equalTo(rootView.snp.bottom)
            make.left.equalTo(rootView.snp.left)
        }
        articleWrapper.addSubview(articleTitle)
        articleTitle.snp.makeConstraints { make -> Void in
            make.height.equalTo(150)
            make.width.equalTo(UIScreen.main.bounds.width / 2)
            make.top.equalTo(rootView.snp.top)
            make.bottom.equalTo(rootView.snp.bottom)
            make.right.equalTo(rootView.snp.right)
            make.left.equalTo(articleImage.snp.right)
        }
        articleWrapper.snp.makeConstraints { make -> Void in
            make.height.equalTo(150)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(rootView.snp.top)
            make.left.equalTo(rootView.snp.left)
            make.right.equalTo(rootView.snp.right)
            make.bottom.equalTo(rootView.snp.bottom)
        }
    }
    
    func initTopicCell() {
        let rootView = self
        topicWrapper.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        topicTitle.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        self.addSubview(topicWrapper)
        topicWrapper.addSubview(topicTitle)
        topicTitle.snp.makeConstraints { make -> Void in
            make.height.equalTo(150)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(rootView.snp.top)
            make.bottom.equalTo(rootView.snp.bottom)
            make.left.equalTo(rootView.snp.left)
            make.right.equalTo(rootView.snp.right)
        }
        topicWrapper.snp.makeConstraints { make -> Void in
            make.height.equalTo(150)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(rootView.snp.top)
            make.left.equalTo(rootView.snp.left)
            make.right.equalTo(rootView.snp.right)
            make.bottom.equalTo(rootView.snp.bottom)
        }
    }
}
