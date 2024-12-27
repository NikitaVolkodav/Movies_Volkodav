import Foundation

final class PreloaderViewModel {
        
    weak var coordinator: PreloaderCoordinator?
    
    func startPreloaderTimer() {
        Timer.scheduledTimer(withTimeInterval: 3.0,
                             repeats: false) { [weak self] _ in
            self?.runMain()
        }
    }
}
//MARK: - Coordinator
private extension PreloaderViewModel {
     func runMain() {
         coordinator?.runMain()
    }
}
