import Foundation
// MARK: - MovieDetailsModel
struct MovieDetailsModel: Decodable {
    let genres: [Genre]
    let originalTitle: String
    let overview: String
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let voteAverage: Double
    let posterPath: String?
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let name: String
}
