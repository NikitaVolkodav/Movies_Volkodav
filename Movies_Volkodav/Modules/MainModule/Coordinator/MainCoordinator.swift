import UIKit

final class MainCoordinator: BaseCoordinator {
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.viewModel.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        navigationController.pushViewController(mainViewController, animated: true)
    }
}
