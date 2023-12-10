//
//  PostData.swift
//  H4X0R News
//
//  Created by Alex on 01/09/2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
