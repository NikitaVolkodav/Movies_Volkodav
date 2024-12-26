import Foundation
import Alamofire

protocol GetMoviesRequestable {
    func getMovies(page: Int, completion: @escaping (Result<MovieModel, NetworkError>) -> Void)
}

final class NetworkManager {
    private let reachabilityManager = NetworkReachabilityManager()
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDJlZjMyYzY4NjJmMWQ4ZWQ0YThhMDRmZWQ1ZmFiZCIsIm5iZiI6MTczNTA1NTkxMC41NDMsInN1YiI6IjY3NmFkYTI2MmQyNTJjZjViNzY0YWNjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lN009hTG4QkDAZdp3Gnk8N2EDf0n8_eB1Zi6WkWWr7A"
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        return components
    }()
    
    private func makeURL(for path: String,
                         queryItems: [URLQueryItem] = []) -> URL? {
        var components = urlComponents
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    private func isNetworkReachable() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    private func performRequest<T: Decodable>(with url: URL,
                                              completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard isNetworkReachable() else {
            completion(.failure(.noInternetConnection))
            return
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        AF.request(url, headers: headers).validate().responseData { response in
            
            switch response.result {
            case .success(let data):
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError))
                }
                
            case .failure(let error):
                
                if let httpResponse = response.response {
                    
                    if !(200...299).contains(httpResponse.statusCode) {
                        completion(.failure(.invalidResponse))
                    } else {
                        completion(.failure(.networkError))
                    }
                }
            }
        }
    }
}

// MARK: - GetMoviesRequestable
extension NetworkManager: GetMoviesRequestable {
    func getMovies(page: Int, completion: @escaping (Result<MovieModel, NetworkError>) -> Void) {
        let queryItems = [
            QueryParameter.includeAdult(false).queryItem,
            QueryParameter.includeVideo(false).queryItem,
            QueryParameter.language("en-US").queryItem,
            QueryParameter.page(page).queryItem,
            QueryParameter.sortBy("popularity.desc").queryItem
        ]
        
        guard let url = makeURL(for: APIEndpoint.discoverMovies.path, queryItems: queryItems) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performRequest(with: url, completion: completion)
    }
}
