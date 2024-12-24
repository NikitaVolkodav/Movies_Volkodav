import UIKit

final class NavigationView: BaseInitView {
    
    private let leftButton = UIButton()
    private let titleLabel = UILabel()
    private let rightButton = UIButton()
    
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    
    override func setView() {
    }
    
    override func addSubviews() {
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(rightButton)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func configureNavigation(leftHidden: Bool,
                             title: String = "Popular Movies",
                             rightHidden: Bool) {
        leftButton.isHidden = leftHidden
        titleLabel.text = title
        rightButton.isHidden = rightHidden
    }
}
//MARK: - setupConfiguration
private extension NavigationView {
    func setupViewsConfiguration() {
        configLeftButton()
        configRightButton()
        configTitleLabel()
    }
    
    func configLeftButton() {
        let backImage = UIImage(systemName: "chevron.backward")?
            .withTintColor(.black,
                           renderingMode: .alwaysOriginal)
        leftButton.setImage(backImage, for: .normal)
        
        let action = UIAction { [weak self] _ in
            self?.leftButtonAction?()
        }
        
        leftButton.addAction(action, for: .touchUpInside)
    }
    
    func configRightButton() {
        let filterImage = UIImage(systemName: "arrow.up.and.down.text.horizontal")?
            .withTintColor(.black,
                           renderingMode: .alwaysOriginal)
        rightButton.setImage(filterImage, for: .normal)
        
        let action = UIAction { [weak self] _ in
            self?.rightButtonAction?()
        }
        
        rightButton.addAction(action, for: .touchUpInside)
    }
    
    func configTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20)
    }

}
//MARK: - setupConstraints
private extension NavigationView {
    func setupViewsConstraints() {
        setupLeftButtonConstraints()
        setupRightButtonConstraints()
        setupTitleLabelConstraints()
    }
    
    func setupLeftButtonConstraints() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftButton.topAnchor.constraint(equalTo: topAnchor),
            leftButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupRightButtonConstraints() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rightButton.topAnchor.constraint(equalTo: topAnchor),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
