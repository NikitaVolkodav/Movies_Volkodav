import UIKit

final class DetailsViewModel {
    
    // MARK: - Dependencies
    private let networkManager: MovieDetailsRequestable = NetworkManager()
    weak var coordinator: DetailsCoordinator?
    
    // MARK: - Model
    private var detailsModel: MovieDetailsModel?
    var selectedMovie: Int?
    
    // MARK: - Error Handling
    private var errorMessage: String?
    
    // MARK: - Observables
    @ObservableValue var isLoading: Bool = false
    @ObservableValue var hasError: Bool = false
    
    func loadDetails() {
        guard let selectedMovie = selectedMovie else { return }
        print(selectedMovie)
        isLoading = true
        hasError = false
        getMovieDetails(for: selectedMovie) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
        }
    }
    
    func setDetails() -> (movieTitle: String?,
                          imageUrl: String?,
                          country: String?,
                          year: String?,
                          genre: String?,
                          trailerUrl: String?,
                          rating: String?,
                          description: String?) {
        guard let detailsModel = detailsModel else { return (movieTitle: nil,
                                                             imageUrl: nil,
                                                             country: nil,
                                                             year: nil,
                                                             genre: nil,
                                                             trailerUrl: nil,
                                                             rating: nil,
                                                             description: nil) }
        let movieTitle = detailsModel.originalTitle
        let imageUrl: String? = detailsModel.posterPath.map { "https://image.tmdb.org/t/p/w500\($0)" }
        let country = "\(detailsModel.productionCountries.first?.name ?? "")"
        let year = String(detailsModel.releaseDate.prefix(4))
        let genreIDs = detailsModel.genres.map { $0.id }
        let genresString = GenreService.getGenreNames(for: genreIDs)
        let genres = genresString.joined(separator: ", ")
        let trailerUrl = ""
        let rating = String(format: "%.1f", detailsModel.voteAverage)
        
        let description = detailsModel.overview.description
        
        return (movieTitle: movieTitle,
                imageUrl: imageUrl,
                country: country,
                year: year,
                genre: genres,
                trailerUrl: trailerUrl,
                rating: rating,
                description: description)
    }
}
// MARK: - Network
extension DetailsViewModel {
    func getMovieDetails(for selectedId: Int, completion: @escaping () -> Void) {
        networkManager.getMovieDetails(for: selectedId) { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                detailsModel = success
            case .failure(let error):
                hasError = true
                self.errorMessage = ErrorDescriptionService.description(for: error)
            }
        }
    }
}
//MARK: - Alert
extension DetailsViewModel {
    func showAlertIfNeeded(on viewController: UIViewController) {
        if hasError, let message = errorMessage {
            AlertContainer.showAlert(on: viewController, for: .error(retry: { [weak self] in
                guard let self = self else { return }
                loadDetails()
            }), message: message)
        }
    }
}
// MARK: - Coordinator
extension DetailsViewModel {
    func goBackToMain() {
        coordinator?.goBackToMain()
    }
    
    func runPoster() {
        let imageUrl: String? = detailsModel?.posterPath.map { "https://image.tmdb.org/t/p/w500\($0)" }
        coordinator?.runPosterWith(posterUrl: imageUrl ?? "")
    }
}
