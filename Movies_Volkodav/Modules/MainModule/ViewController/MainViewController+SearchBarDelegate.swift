import UIKit

//MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        viewModel.filterMovies(by: searchText)
        reloadCollectionView()
    }
}
