import UIKit

final class MainCollectionView: UICollectionView {
    
    init(spacing: CGFloat = 24) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    // MARK: - Setup
    private func setup() {
        backgroundColor = .clear
        layer.masksToBounds = true
        clipsToBounds = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
