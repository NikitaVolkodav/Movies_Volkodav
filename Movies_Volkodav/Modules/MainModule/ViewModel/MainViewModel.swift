import Foundation

final class MainViewModel {
    
    private let networkManager: GetMoviesRequestable = NetworkManager()
    private var movieModel: MovieModel?

    weak var coordinator: MainCoordinator?
    @ObservableValue var isLoading: Bool = false

    func loadMovies() {
        isLoading = true
        getMoviews { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
        }
    }
}
// MARK: - Network
extension MainViewModel {
    func getMoviews(completion: @escaping () -> Void) {
        networkManager.getMovies(page: 1) { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                movieModel = success
                print(movieModel)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
// MARK: - Coordinator
extension MainViewModel {
    private func runDetails() {
        coordinator?.runDetails()
    }
}
// MARK: - DataSource
extension MainViewModel {
    func numberOfItems() -> Int {
        movieModel?.results.count ?? 0
    }
    
    func setMovieInfo(at indexPath: IndexPath) -> (titleYear: String?, imageUrl: String?, genres: String?, rating: String?) {
        
        guard let movie = movieModel?.results[indexPath.item] else {
            return (titleYear: nil, imageUrl: nil, genres: nil, rating: nil)
        }
        
        let titleYear: String
        if !movie.releaseDate.isEmpty {
            let year = String(movie.releaseDate.prefix(4))
            titleYear = "\(movie.title), (\(year))"
        } else {
            titleYear = movie.title
        }
        
        let imageUrl: String? = movie.backdropPath.map { "https://image.tmdb.org/t/p/w500\($0)" }
        
        let genresArray = GenreService.getGenreNames(for: movie.genreIds)
        let genres = genresArray.joined(separator: ", ")
        
        let rating = String(format: "%.1f", movie.voteAverage)
        
        return (titleYear: titleYear, imageUrl: imageUrl, genres: genres, rating: rating)
    }
}
// MARK: - Delegate
extension MainViewModel {
    func didSelectItem(at indexPath: IndexPath) {
        runDetails()
    }
}
