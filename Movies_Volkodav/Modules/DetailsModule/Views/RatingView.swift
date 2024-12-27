import UIKit

final class RatingView: BaseInitView {
    
    private let starImageView = UIImageView()
    private let ratingLabel = UILabel()
    
    override func setView() {
        backgroundColor = .black.withAlphaComponent(0.8)
        layer.cornerRadius = 10
    }
    
    override func addSubviews() {
        addSubview(starImageView)
        addSubview(ratingLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setRating(_ text: String?) {
        ratingLabel.text = text
    }
}
//MARK: - setupConfiguration
private extension RatingView {
    func setupViewsConfiguration() {
        configImageView()
        configRatingLabel()
    }
    
    func configImageView() {
        let starImage = UIImage(systemName: "star")?
            .withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        starImageView.image = starImage
        starImageView.contentMode = .scaleAspectFit
    }
    
    func configRatingLabel() {
        ratingLabel.textColor = .systemOrange
    }
}
//MARK: - setupConstraints
private extension RatingView {
    func setupViewsConstraints() {
        setupImageViewConstraints()
        setupRatingLabelConstraints()
    }
    
    func setupImageViewConstraints() {
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupRatingLabelConstraints() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 8),
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
}
