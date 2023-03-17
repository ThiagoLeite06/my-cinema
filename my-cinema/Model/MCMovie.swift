//
//  MCMovie.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import Foundation

struct MCMovie: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    let cover: URL?    
}

struct Genre: Codable {
    let id: Int
    let name: String
}
