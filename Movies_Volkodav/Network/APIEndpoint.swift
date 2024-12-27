import Foundation

enum APIEndpoint {
    case discoverMovies
    case movieDetails(Int)
    
    var path: String {
        switch self {
        case .discoverMovies:
            return "/3/discover/movie"
        case .movieDetails(let id):
            return "/3/movie/\(id)"
        }
    }
}
