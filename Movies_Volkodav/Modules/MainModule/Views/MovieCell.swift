import UIKit

final class MovieCell: BaseCollectionViewCell {
    static let reuseIdentifier = "MovieCell"
    
    private let imageView = KingfisherImageView()
    private let titleYearLabel = UILabel()
    private let genreLabel = UILabel()
    private let ratingView = RatingView()
            
    override func setCell() {
        layer.cornerRadius = 10
        backgroundColor = .white
        configureShadow()
    }
    
    override func addSubviews() {
        addSubview(imageView)
        addSubview(titleYearLabel)
        addSubview(genreLabel)
        addSubview(ratingView)
    }
    
    override func setupConfiguration() {
        setupCellConfiguration()
    }
    
    override func setupConstraints() {
        setupCellsConstraints()
    }
    //MARK: - OpenActions
    func setMovieCell(url: String?,
                      titleYear: String?,
                      genre: String?,
                      rating: String?) {
        let defaultImage = UIImage(systemName: "movieclapper")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.loadImage(from: url, defaultImage: defaultImage)
        titleYearLabel.text = titleYear
        genreLabel.text = genre
        ratingView.setRating(rating)
    }
}
// MARK: - setupConfiguration
private extension MovieCell {
    func setupCellConfiguration() {
        configImageView()
        configTitleYearLabel()
        configGenreLabel()
    }
    
    func configImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemGray
    }
    
    func configTitleYearLabel() {
        titleYearLabel.font = .boldSystemFont(ofSize: 20)
        titleYearLabel.textColor = .systemYellow
    }
    
    func configGenreLabel() {
        genreLabel.font = .systemFont(ofSize: 16)
        genreLabel.textColor = .systemYellow
    }
}
// MARK: - setupConstraints
private extension MovieCell {
    func setupCellsConstraints() {
        setupImageViewConstraints()
        setupTitleYearLabelConstraints()
        setupGenreLabelConstraints()
        setupRatingViewConstraints()
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupTitleYearLabelConstraints() {
        titleYearLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleYearLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 16),
            titleYearLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            titleYearLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupGenreLabelConstraints() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func setupRatingViewConstraints() {
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            ratingView.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            ratingView.heightAnchor.constraint(equalToConstant: 40),
            ratingView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

