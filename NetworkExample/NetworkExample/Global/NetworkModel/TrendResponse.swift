//
//  TrendResponse.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

// MARK: - Trend Response

struct TrendResponse: Codable {
    let results: [TrendMedia]
    let page, totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result

struct TrendMedia: Codable {
    let posterPath: String
    let backdropPath: String
    let originalTitle, title: String?
    let id: Int
    let releaseDate: String?
    let voteAverage: Double
    let adult: Bool
    let overview: String
    let genre: [Int]
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case title
        case id
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case adult, overview
        case genre = "genre_ids"
    }
}
