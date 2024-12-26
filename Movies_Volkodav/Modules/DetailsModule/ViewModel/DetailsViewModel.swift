import Foundation

final class DetailsViewModel {
    
    weak var coordinator: DetailsCoordinator?

}
// MARK: - Coordinator
extension DetailsViewModel {
    func goBackToMain() {
        coordinator?.goBackToMain()
    }
}
