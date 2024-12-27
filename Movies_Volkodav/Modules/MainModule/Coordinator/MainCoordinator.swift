import UIKit

final class MainCoordinator: BaseCoordinator {
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.viewModel.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func runDetailsWith(selectedMovie: Int) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController,
                                                    selectedMovie: selectedMovie)
        detailsCoordinator.parentCoordinator = self
        add(coordinator: detailsCoordinator)
        detailsCoordinator.start()
    }
}
