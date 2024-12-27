import Foundation
struct ErrorDescriptionService {
    static func description(for error: NetworkError) -> String {
        switch error {
        case .invalidURL:
            return "The URL provided is invalid. Please check and try again."
        case .invalidResponse:
            return "The server returned an invalid response. Please try again later."
        case .decodingError:
            return "There was an error decoding the data. Please contact support."
        case .networkError:
            return "A network error occurred. Please check your connection."
        case .noInternetConnection:
            return "You are offline. Please, enable your Wi-Fi or connect using cellular data."
        }
    }
}
