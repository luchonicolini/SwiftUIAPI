//
//  APIHaking.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import Foundation

class HackerNetworkManager: ObservableObject {
    @Published var PostHaking = [HakingPost]()
    
    final func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response,error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.PostHaking = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
