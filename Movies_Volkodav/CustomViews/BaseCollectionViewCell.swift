import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeCell()
    }
    
    private func initializeCell() {
        setCell()
        addSubviews()
        setupConfiguration()
        setupConstraints()
    }
    
    func setCell() {}
    
    func addSubviews() {}
    
    func setupConfiguration() {}
    
    func setupConstraints() {}
    
    func configureShadow(color: UIColor = UIColor.black.withAlphaComponent(0.1),
                         opacity: Float = 1,
                         radius: CGFloat = 10,
                         offset: CGSize = .zero) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
}
