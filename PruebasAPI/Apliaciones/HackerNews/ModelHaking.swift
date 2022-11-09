//
//  ModelHaking.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import Foundation

struct Results: Decodable {
    let hits: [HakingPost]
}
struct HakingPost: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
