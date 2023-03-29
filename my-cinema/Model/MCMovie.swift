//
//  MCMovie.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import Foundation

struct MCMovie: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let cover: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, video
        case id
        case overview, popularity, title,cover
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}
