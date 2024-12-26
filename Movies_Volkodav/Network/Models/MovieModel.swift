import Foundation

// MARK: - MovieModel
struct MovieModel: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    let genreIds: [Int]
    let adult: Bool
    let backdropPath: String?
}
