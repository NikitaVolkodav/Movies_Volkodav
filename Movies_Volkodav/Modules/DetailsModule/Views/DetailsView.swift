import UIKit

final class DetailsView: BaseInitView {
    
    private let countryView = UIButton()
    private let yearView = UIButton()
    private let stackView = UIStackView()
    
    override func setView() {
    }
    
    override func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(countryView)
        stackView.addArrangedSubview(yearView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setDetails(country: String?,
                    year: String?) {
        countryView.setTitle("  \(country ?? "")  ", for: .normal)
        yearView.setTitle("  \(year ?? "")  ", for: .normal)
    }
}
//MARK: - setupConfiguration
private extension DetailsView {
    func setupViewsConfiguration() {
        configStackView()
        configViews()
    }
    
    func configStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
    }
    
    func configViews() {
        countryView.backgroundColor = .gray
        countryView.layer.cornerRadius = 10
        yearView.backgroundColor = .gray
        yearView.layer.cornerRadius = 10
    }
}
//MARK: - setupConstraints
private extension DetailsView {
    func setupViewsConstraints() {
        setupStackViewConstraints()
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
