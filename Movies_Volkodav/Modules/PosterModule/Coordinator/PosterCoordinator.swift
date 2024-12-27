import UIKit

final class PosterCoordinator: BaseCoordinator {
    
    private let posterUrl: String
    
    init(navigationController: UINavigationController,
         posterUrl: String) {
        self.posterUrl = posterUrl
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let posterViewController = PosterViewController()
        posterViewController.viewModel.coordinator = self
        posterViewController.viewModel.posterUrl = posterUrl
        navigationController.pushViewController(posterViewController, animated: true)
    }
    
    func goBackToDetails() {
        goBack()
    }
}
