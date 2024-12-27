import UIKit

final class PosterContentView: BaseInitView {
    
    private let scrollView = UIScrollView()
    private let posterImageView = KingfisherImageView()
    private let closeButton = UIButton()
    
    var closeAction: (() -> Void)?
    
    override func setView() {
        backgroundColor = .black
    }
    
    override func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(posterImageView)
        addSubview(closeButton)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func loadPosterImage(from url: String?) {
        posterImageView.loadImage(from: url, defaultImage: .actions)
    }
}
//MARK: - setupConfiguration
private extension PosterContentView {
    func setupViewsConfiguration() {
        configScrollView()
        configPosterImageView()
        configCloseButton()
        setupGestures()
    }
    
    func configScrollView() {
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func configPosterImageView() {
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.isUserInteractionEnabled = true
    }
    
    func configCloseButton() {
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        
        let action = UIAction { [weak self] _ in
            self?.closeAction?()
        }
        closeButton.addAction(action, for: .touchUpInside)
    }
    
    func setupGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        if gesture.state == .ended && translation.y > 150 {
            closeAction?()
        }
    }
}
//MARK: - UIScrollViewDelegate
extension PosterContentView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        posterImageView
    }
}

//MARK: - UIGestureRecognizerDelegate
extension PosterContentView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
//MARK: - setupConstraints
private extension PosterContentView {
    func setupViewsConstraints() {
        setupScrollViewConstraints()
        setupPosterImageViewConstraints()
        setupCloseButtonConstraints()
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupPosterImageViewConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            posterImageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            posterImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            posterImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    func setupCloseButtonConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
