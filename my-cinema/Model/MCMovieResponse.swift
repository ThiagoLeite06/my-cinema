//
//  MCMovieResponse.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import Foundation

struct MCMovieResponse: Codable {
    let page: Int?
    let results: [MCMovie]
    let totalResults: Int?
    let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
