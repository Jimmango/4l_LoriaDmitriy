//
//  NewsModel.swift
//  AppTest
//
//  Created by Dima Loria on 06.06.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import Foundation

struct NewsModel {
    var article: [Article]
}

struct Article {
    var title: String?
    var description: String?
    var author: String?
}

