import UIKit
//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifier,
                                 for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        let movies = viewModel.setMovieInfo(at: indexPath)
        
        cell.setMovieCell(url: movies.imageUrl,
                          titleYear: movies.titleYear,
                          genre: movies.genres,
                          rating: movies.rating)
        
        return cell
    }
    
}
//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 16 * 2
        let itemWidth = (collectionView.bounds.width) - totalSpacing
        let itemHeight: CGFloat = 280
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
