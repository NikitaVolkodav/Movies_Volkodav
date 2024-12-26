import Foundation

enum QueryParameter {
    case includeAdult(Bool)
    case includeVideo(Bool)
    case language(String)
    case page(Int)
    case sortBy(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .includeAdult(let value):
            return URLQueryItem(name: "include_adult", value: String(value))
        case .includeVideo(let value):
            return URLQueryItem(name: "include_video", value: String(value))
        case .language(let value):
            return URLQueryItem(name: "language", value: value)
        case .page(let value):
            return URLQueryItem(name: "page", value: String(value))
        case .sortBy(let value):
            return URLQueryItem(name: "sort_by", value: value)
        }
    }
}
