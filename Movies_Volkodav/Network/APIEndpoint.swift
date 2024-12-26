import Foundation

enum APIEndpoint: String {
    case discoverMovies = "/3/discover/movie"
    
    var path: String {
        return self.rawValue
    }
}
