//
//  API.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 11/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class API: ApiProtocol {
    
    func getAsync(type: Int, params: Dictionary<String, String>?, completion: @escaping (JSON?, Error?) -> ()) {
        if type == 0 {
            fetchArticles(params: params, completion: completion)
        } else if type == 1 {
            
        } else {
            return
        }
    }
    
    func fetchArticles(params: Dictionary<String, String>?, completion: @escaping (JSON?, Error?) -> ()) {
        var mutableUrl = "\(Statics.url)/test/json.php"
        if params != nil {
            let size = params!.count
            if size != 0 {
                for paramIndex in 0...(size - 1) {
                    var char: String
                    if paramIndex == 0 {
                        char = "?"
                    } else {
                        char = "&"
                    }
                    mutableUrl = "\(mutableUrl)\(char)\(Array(params!.keys)[paramIndex])=\(Array(params!.values)[paramIndex])"
                }
            }
            print(mutableUrl)
            
            let resp = baseHttpGet(urlWithParams: mutableUrl)
            
            resp.responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(json, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    private func baseHttpGet(urlWithParams: String) -> DataRequest {
        return Alamofire.request(urlWithParams)
    }
}
