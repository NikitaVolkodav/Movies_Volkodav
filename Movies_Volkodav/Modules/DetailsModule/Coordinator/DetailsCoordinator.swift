import UIKit

final class DetailsCoordinator: BaseCoordinator {
    
    private let selectedMovie: Int
    
    init(navigationController: UINavigationController,
         selectedMovie: Int) {
        self.selectedMovie = selectedMovie
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let breedDetailsViewController = DetailsViewController()
        breedDetailsViewController.viewModel.coordinator = self
        breedDetailsViewController.viewModel.selectedMovie = selectedMovie
        navigationController.pushViewController(breedDetailsViewController, animated: true)
    }
    
    func goBackToMain() {
        goBack()
    }
}
