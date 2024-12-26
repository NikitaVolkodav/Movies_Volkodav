import UIKit

enum SortingOption: String, CaseIterable {
    case byPopularity = "By Popularity"
    case byName = "By Name"
    case byRating = "By Rating"
}

final class AlertService {
    func showSortingActionSheet(
        from viewController: UIViewController,
        options: [SortingOption],
        selectedOption: SortingOption,
        onOptionSelected: @escaping (SortingOption) -> Void
    ) {
        let alertController = UIAlertController(title: "Sort by",
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        for option in options {
            let action = UIAlertAction(title: option.rawValue,
                                       style: .default) { _ in
                onOptionSelected(option)
            }
            
            if option == selectedOption {
                action.setValue(true, forKey: "checked")
            }
            
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}
