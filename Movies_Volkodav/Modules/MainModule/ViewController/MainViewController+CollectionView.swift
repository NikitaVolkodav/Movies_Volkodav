import UIKit
//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
//        viewModel.numberOfItems()
        10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifier,
                                 for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
//        let breeds = viewModel.setBreedInfo(at: indexPath)
        cell.setMovieCell(url: nil,
                          titleYear: "Людина павук, 2004",
                          genre: "Детектив",
                          rating: "10.0")
        
        return cell
    }
    
}
//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
//        viewModel.didSelectBreed(at: indexPath)
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
