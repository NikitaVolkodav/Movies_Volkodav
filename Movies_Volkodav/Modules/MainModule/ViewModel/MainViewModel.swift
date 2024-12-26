import Foundation

final class MainViewModel {
    
    weak var coordinator: MainCoordinator?
}
// MARK: - Coordinator
extension MainViewModel {
    private func runDetails() {
        coordinator?.runDetails()
    }
}
// MARK: - DataSource
extension MainViewModel {
    func numberOfItems() -> Int {
        20
    }
}
// MARK: - Delegate
extension MainViewModel {
    func didSelectItem(at indexPath: IndexPath) {
        runDetails()
    }
}
