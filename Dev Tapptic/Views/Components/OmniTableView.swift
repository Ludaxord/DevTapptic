//
//  DevTappticTableView.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class DevTappticTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var _articles: Array<JSONModel>
    var devTappticWidth: CGFloat
    var devTappticHeight: CGFloat
    var _frame: CGRect
    var articleCell: ArticleCell
    var articleVisible = true
    var devTapptic: DevTapptic
    var uiPreferences: UIPreferences
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _articles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = _articles[indexPath.row]
        let articleDetailsController = ArticleDetailsController(_devTapptic: devTapptic, _uiPreferences: uiPreferences, _article: article)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.window!.layer.add(transition, forKey: nil)
        self.window?.rootViewController?.present(articleDetailsController, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell",for: indexPath) as! ArticleCell
        
        cell.articleTitle.text = "\(_articles[indexPath.row].name!)"
        cell.articleTitle.sizeToFit()
        cell.articleTitle.textAlignment = .center
        cell.articleTitle.numberOfLines = 0;
        cell.articleTitle.lineBreakMode = .byWordWrapping;
        
        let imageId = _articles[indexPath.row].imageUrl
        if (imageId != nil) {
            let imageUrl = URL(string: imageId!)
            cell.articleImage.kf.setImage(with: imageUrl!)
            cell.articleImage.isHidden = false
        } else {
            cell.articleImage.isHidden = true
            cell.articleTitle.snp.makeConstraints { make -> Void in
                make.height.equalTo(150)
                make.width.equalTo(uiPreferences.getScreenSize().width)
                make.top.equalTo(cell.snp.top)
                make.left.equalTo(cell.snp.left)
                make.right.equalTo(cell.snp.right)
                make.bottom.equalTo(cell.snp.bottom)
            }
        }
    
        return cell
    }
    
    init(articles: Array<JSONModel>?, width: CGFloat, height: CGFloat, frame: CGRect?, _devTapptic: DevTapptic, _uiPreferences: UIPreferences) {
        if (articles != nil) {
            _articles = articles!
        } else {
            _articles = Array<JSONModel>()
        }
        devTappticWidth = width
        devTappticHeight = height
        devTapptic = _devTapptic
        uiPreferences = _uiPreferences
        articleCell = ArticleCell(identifier: "ArticleCell")
        if frame == nil {
            _frame = CGRect(x: 0, y: 0, width: devTappticWidth, height: devTappticHeight)
        } else {
            _frame = frame!
        }
        super.init(frame: _frame, style: UITableView.Style.plain)
        initArticles()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initArticles() {
        self.register(articleCell.classForCoder, forCellReuseIdentifier: "ArticleCell")
        self.dataSource = self
        self.delegate = self
        if _articles.isEmpty {
            self.isHidden = true
        } else {
            self.isHidden = false
        }
    }
    
    public func refreshTable(articles: Array<JSONModel>) {
        _articles = articles
        if _articles.isEmpty {
            self.isHidden = true
        } else {
            self.isHidden = false
        }
        self.reloadData()
    }
    
}
