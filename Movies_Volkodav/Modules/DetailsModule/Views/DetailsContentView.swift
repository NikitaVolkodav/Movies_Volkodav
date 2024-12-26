import UIKit

final class DetailsContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    private let scrollView = UIScrollView()
    private let imageView = KingfisherImageView()
    private let titleLabel = UILabel()
    private let trailerButton = UIButton()
    private let ratingView = RatingView()
    private let detailsView = DetailsView()
    private let descriptionLabel = UILabel()
    
    var backButtonAction: (() -> Void)?
    var trailerButtonAction: (() -> Void)?
    
    override func setView() {
        backgroundColor = .white 
    }
    
    override func addSubviews() {
        addSubview(navigationView)
        addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(trailerButton)
        scrollView.addSubview(ratingView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(detailsView)
        scrollView.addSubview(descriptionLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setupBackButton(_ action: (() -> Void)?) {
        navigationView.leftButtonAction = action
    }
    
    func setDetails(movieTitle: String?,
                    imageUrl: String?,
                    country: String?,
                    year: String?,
                    genre: String?,
                    trailerUrl: String?,
                    rating: String?,
                    description: String?) {
        navigationView.configureNavigation(leftHidden: false,
                                           title: movieTitle ?? "",
                                           rightHidden: true)
        titleLabel.text = movieTitle
        imageView.loadImage(from: imageUrl, defaultImage: UIImage(ciImage: .blue))
        ratingView.setRating(rating)
        detailsView.setDetails(country: country, year: year, genre: genre)
        descriptionLabel.text = description
    }
}
//MARK: - setupConfiguration
private extension DetailsContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configImageView()
        configTitleLabel()
        configTrailerButton()
        configDescriptionLabel()
    }
    
    func configNavigationView() {
        navigationView.configureNavigation(leftHidden: false,
                                           title: "",
                                           rightHidden: true)
    }
    
    func configImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemBlue
    }
    
    func configTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    func configTrailerButton() {
        trailerButton.backgroundColor = .systemOrange
        trailerButton.layer.cornerRadius = 20
        trailerButton.setTitle("Trailer", for: .normal)
        trailerButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        let action = UIAction { [weak self] _ in
            self?.trailerButtonAction?()
        }
        
        trailerButton.addAction(action, for: .touchUpInside)
    }
    
    func configDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 22)
        descriptionLabel.textAlignment = .center
    }
}
//MARK: - setupConstraints
private extension DetailsContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
        setupScrollViewConstraints()
        setupImageViewConstraints()
        
        setupRatingViewConstraints()
        
        setupTitleLabelConstraints()
        
        setupDetailsViewConstraints()
        
        setupTrailerButtonConstraints()
        setupDescriptionLabelConstraints()
    }
    
    func setupNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor,
                                              constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func setupTrailerButtonConstraints() {
        trailerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailerButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            trailerButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -60),
            trailerButton.heightAnchor.constraint(equalToConstant: 57),
            trailerButton.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func setupRatingViewConstraints() {
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            ratingView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            ratingView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            ratingView.heightAnchor.constraint(equalToConstant: 40),
            ratingView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func setupDetailsViewConstraints() {
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            detailsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            detailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            detailsView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
}
