import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator)
    func goBack()
}

extension Coordinator {
    func add(coordinator: Coordinator) {
        childCoordinators.append(coordinator)

    }
    
    func remove(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }

    func childDidFinish(_ child: Coordinator) {
        remove(coordinator: child)
    }
    
    func goBack() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
}
