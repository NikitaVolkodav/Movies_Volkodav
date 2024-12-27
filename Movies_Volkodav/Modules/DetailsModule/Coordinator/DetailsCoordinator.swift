import UIKit

final class DetailsCoordinator: BaseCoordinator {
    
    private let selectedMovie: Int
    
    init(navigationController: UINavigationController,
         selectedMovie: Int) {
        self.selectedMovie = selectedMovie
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let detailsViewController = DetailsViewController()
        detailsViewController.viewModel.coordinator = self
        detailsViewController.viewModel.selectedMovie = selectedMovie
        navigationController.pushViewController(detailsViewController, animated: true)
    }
    
    func runPosterWith(posterUrl: String) {
        let posterCoordinator = PosterCoordinator(navigationController: navigationController,
                                                   posterUrl: posterUrl)
        posterCoordinator.parentCoordinator = self
        add(coordinator: posterCoordinator)
        posterCoordinator.start()
    }
    
    func goBackToMain() {
        goBack()
    }
}
