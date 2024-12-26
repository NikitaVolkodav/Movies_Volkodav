import UIKit

final class DetailsCoordinator: BaseCoordinator {
    
    override func start() {
        let breedDetailsViewController = DetailsViewController()
        breedDetailsViewController.viewModel.coordinator = self
        navigationController.pushViewController(breedDetailsViewController, animated: true)
    }
    
    func goBackToMain() {
        goBack()
    }
}
