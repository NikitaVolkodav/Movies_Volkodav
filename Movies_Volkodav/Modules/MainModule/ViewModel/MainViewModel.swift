import UIKit

final class MainViewModel {
    
    // MARK: - Dependencies
    private let networkManager: GetMoviesRequestable = NetworkManager()
    private let alertService = AlertService()

    // MARK: - Properties
    private(set) var selectedSortingOption: SortingOption = .byPopularity
    private var sortingOptions: [SortingOption] {
        return SortingOption.allCases
    }

    // MARK: - Movie Data
    private var currentPage: Int = 1
    private var movieModel: MovieModel?
    private var movies: [Movie] = []
    private var currentModel: [Movie] = []


    // MARK: - Observables
    @ObservableValue var isLoading: Bool = false

    // MARK: - Callbacks
    var onSortingOptionSelected: ((SortingOption) -> Void)?

    // MARK: - Coordinator
    weak var coordinator: MainCoordinator?

    func loadMovies() {
        isLoading = true
        getMoviews(page: currentPage) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
        }
    }
    
    func resetMovies() {
        currentPage = 1
        movies.removeAll()
    }
}
// MARK: - Network
extension MainViewModel {
    func getMoviews(page: Int, completion: @escaping () -> Void) {
        networkManager.getMovies(page: page) { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.movies.append(contentsOf: success.results)
                currentModel = movies
                currentPage += 1
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
//MARK: - Alert
extension MainViewModel {

    func showSortingOptions(from viewController: UIViewController) {
        alertService.showSortingActionSheet(
            from: viewController,
            options: sortingOptions,
            selectedOption: selectedSortingOption
        ) { [weak self] selectedOption in
            guard let self = self else { return }
            self.selectSortingOption(selectedOption)
        }
    }
    
    private func selectSortingOption(_ option: SortingOption) {
           selectedSortingOption = option
           applySorting(option)
           onSortingOptionSelected?(option)
       }

       private func applySorting(_ option: SortingOption) {
           switch option {
           case .byPopularity:
               print("Applying sorting by popularity")
               currentModel = movies

           case .byName:
               currentModel = movies.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }

               print("Applying sorting by name")
           case .byRating:
               currentModel = movies.sorted { $0.voteAverage > $1.voteAverage }

               print("Applying sorting by rating")
           }
       }
}
// MARK: - DataSource
extension MainViewModel {
    func numberOfItems() -> Int {
        currentModel.count
//        movies.count
    }
    
    func setMovieInfo(at indexPath: IndexPath) -> (titleYear: String?, imageUrl: String?, genres: String?, rating: String?) {
//        let movie = movies[indexPath.item]
        let movie = currentModel[indexPath.item]
        
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
    
    func shouldLoadMoreData(at indexPath: IndexPath) {
        let totalItems = movies.count
        if indexPath.item == totalItems - 1 && totalItems % 20 == 0 {
            guard !isLoading else { return }
            loadMovies()
        }
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        runDetails()
    }
}
