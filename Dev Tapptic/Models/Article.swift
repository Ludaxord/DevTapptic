//
//  Article.swift
//  DevTapptic 
//
//  Created by Konrad Uciechowski on 12/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    var articleId: String? = nil
    var titleValue: String? = nil
    var authors: Dictionary<String?, String?>? = nil
    var resources: [JSON]? = nil
    var tags: [JSON]? = nil
    var type: String? = nil
    var categoryId: String? = nil
    var categoryTitle: String? = nil
    var categorySlug: String? = nil
    var categoryLargeThreshold: String? = nil
    var categoryIconUrl: String? = nil
    var categoryIconColorRed: String? = nil
    var categoryIconColorGreen: String? = nil
    var categoryIconColorBlue: String? = nil
    var categoryDefault: String? = nil
    var changesPublished: String? = nil
    var changesModified: String? = nil
    var storyType: String? = nil
    var storyTitle: String? = nil
    var storyTopicId: String? = nil
    var mainTextType: String? = nil
    var mainTextParagraphs: Dictionary<String?, String?>? = nil
    var mainResourceType: String? = nil
    var mainResourceBylineTitle: String? = nil
    var mainResourceCaption: String? = nil
    var mainResourceSourceId: String? = nil
    var mainResourceImageAssetsId: String? = nil
    var mainResourceImageAssetsSizeWidth: String? = nil
    var mainResourceImageAssetsSizeHeight: String? = nil
    var storyVignetteRef: String? = nil
    var storyVignetteId: String? = nil
    var storyVignetteTitle: String? = nil
    var storyVignetteSuperTagTopicId: String? = nil
    var storyVignetteSuperTagTitle: String? = nil
    var storyVignetteSuperTagText: String? = nil
}
