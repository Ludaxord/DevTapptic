//
//  ApiProtocol.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 11/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ApiProtocol {
    func getAsync(type: Int, params: Dictionary<String, String>?, completion: @escaping (JSON?, Error?) -> ())
}
