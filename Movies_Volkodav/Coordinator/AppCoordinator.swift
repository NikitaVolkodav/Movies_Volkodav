import UIKit

final class AppCoordinator: BaseCoordinator {
    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        super.init(navigationController: navigationController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    override func start() {
        let preloaderCoordinator = PreloaderCoordinator(navigationController: navigationController)
        preloaderCoordinator.parentCoordinator = self
        add(coordinator: preloaderCoordinator)
        preloaderCoordinator.start()
    }
}
