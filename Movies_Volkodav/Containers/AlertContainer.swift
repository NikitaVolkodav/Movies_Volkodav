import UIKit

enum AlertType {
    case error(retry: () -> Void)
}

struct AlertContainer {
    static func showAlert(on viewController: UIViewController, for type: AlertType, message: String = "") {
        switch type {
        case .error(let retry):
            let alertController = UIAlertController(title: "Error",
                                                    message: message,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Retry",
                                                    style: .default) { _ in retry() })
            viewController.present(alertController,
                                   animated: true)
        }
    }
}
