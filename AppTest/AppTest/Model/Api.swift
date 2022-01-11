//
//  Api.swift
//  AppTest
//
//  Created by Dima Loria on 21.05.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import UIKit

struct Articles: Codable {
    var author: String?
    var title: String?
    var description: String?
}

struct NewsAPI: Codable {
    var isExtended: Bool = false
    var articles: [Articles] = [Articles]()
    
    private enum NewsResponseKeys: String, CodingKey {
        case articles
    }
    
    init(from decoder: Decoder) throws {
        if let NewsAPIContainer = try? decoder.container(keyedBy: NewsResponseKeys.self) {
            self.articles = try NewsAPIContainer.decode([Articles].self, forKey: NewsResponseKeys.articles)
        }
    }
}

