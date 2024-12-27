import UIKit

final class PreloaderCoordinator: BaseCoordinator {
    
    override func start() {
        let preloaderViewController = PreloaderViewController()
        preloaderViewController.viewModel.coordinator = self
        navigationController.pushViewController(preloaderViewController, animated: true)
    }
    
    func runMain() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.parentCoordinator = self
        add(coordinator: mainCoordinator)
        mainCoordinator.start()
    }
}
