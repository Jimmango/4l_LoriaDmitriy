//
//  NewsFeed.swift
//  AppTest
//
//  Created by Dima Loria on 19.05.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import UIKit

// MARK: - Properties

struct NewsFeed {
    
    static let shared = NewsFeed()

    func request(urlString: String, completion: @escaping (Result<NewsAPI, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to fetch data with error: ", error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    guard let news = try? JSONDecoder().decode(NewsAPI.self, from: data) else { return }
                    
                    completion(.success(news))
                }   catch let jsonError {
                    print("Failed to decode JSON", jsonError.localizedDescription)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
