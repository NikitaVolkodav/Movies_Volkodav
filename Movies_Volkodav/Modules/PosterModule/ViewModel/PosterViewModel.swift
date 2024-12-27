import Foundation

final class PosterViewModel {
    
    weak var coordinator: PosterCoordinator?
    var posterUrl: String?
}
// MARK: - Coordinator
extension PosterViewModel {
    func goBack() {
        coordinator?.goBackToDetails()
    }
}
