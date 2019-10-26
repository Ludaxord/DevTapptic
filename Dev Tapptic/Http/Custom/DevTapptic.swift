//
//  DevTapptic.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 11/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import Foundation
import SwiftyJSON

class DevTapptic: API {
    
    override init() {
        super.init()
        print("\(String(describing: self)) injected")
    }
        
    public static let instance = DevTapptic()
    
    func httpGetArticlesDetails(name: String, articleCompletion: @escaping(JSONModel?, String?)-> ()) {
        var params: Dictionary<String, String> = Dictionary()
        params[Statics.nameKey] = name
        getAsync(type: 0, params: params) { json, error in
            var jsonModel = JSONModel()
            if json != nil {
                if json![Statics.textKey].exists() {
                    jsonModel.text = json![Statics.textKey].string
                }
                
                if json![Statics.nameKey].exists() {
                    jsonModel.name = json![Statics.nameKey].string
                }
                
                if json![Statics.imageKey].exists() {
                    jsonModel.imageUrl = json![Statics.imageKey].string
                }
                articleCompletion(jsonModel, nil)
            } else if error != nil {
                let errorMessage = "Ups! looks like we've got error: \(error?.localizedDescription)"
                articleCompletion(nil, errorMessage)
            }
        }
    }
    
    func httpGetArticlesByQuery(articleCompletion: @escaping (Array<JSONModel>?, String?) -> ()) {
        var params: Dictionary<String, String> = Dictionary()
        getAsync(type: 0, params: params) { json, error in
            print(json)
            if json != nil {
                var articlesList: Array<JSONModel> = Array()
                for (_, article) in json! {
                        var articleObject = JSONModel()
                        
                        let title = article[Statics.nameKey]
                        if title.exists() {
                            articleObject.name = title.string
                        }
                        
                        let image = article[Statics.imageKey]
                        if image.exists() {
                            articleObject.imageUrl = image.string
                        }
                        
                        articlesList.append(articleObject)
                    }
                    articleCompletion(articlesList, nil)

            } else if error != nil {
                let errorMessage = "Ups! looks like we've got error: \(error?.localizedDescription)"
                articleCompletion(nil, errorMessage)
            } else {
                let errorMessage = "Ups! unresolved error ocurred"
                articleCompletion(nil, errorMessage)
            }
        }
    }
}
