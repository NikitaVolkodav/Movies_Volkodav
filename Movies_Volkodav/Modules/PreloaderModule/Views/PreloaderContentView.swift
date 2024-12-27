import UIKit

final class PreloaderContentView: BaseInitView {
    
    private let iconImageView = UIImageView()
    private let loaderView = LoaderView()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(iconImageView)
        addSubview(loaderView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func stopLoaderView() {
        loaderView.stopRotating()
    }
}
//MARK: - setupConfiguration
private extension PreloaderContentView {
    func setupViewsConfiguration() {
        configurationIconImageView()
        configLoaderView()
    }
    
    func configurationIconImageView() {
        iconImageView.backgroundColor = .systemBlue
        iconImageView.layer.cornerRadius = 20
    }
    
    func configLoaderView() {
        loaderView.startRotating(duration: 3.0)
    }
}
//MARK: - setupConstraints
private extension PreloaderContentView {
    func setupViewsConstraints() {
        setupIconImageViewConstraints()
        setupLoaderViewConstraints()
    }
    
    func setupIconImageViewConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 124),
            iconImageView.widthAnchor.constraint(equalToConstant: 124)
        ])
    }
    
    func setupLoaderViewConstraints() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        let loaderViewBottomAnchor = getHeightConstant(smallHeight: -30, largeHeight: -70)
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loaderView.heightAnchor.constraint(equalToConstant: 100),
            loaderView.widthAnchor.constraint(equalToConstant: 100),
            loaderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: loaderViewBottomAnchor)
        ])
    }
}
