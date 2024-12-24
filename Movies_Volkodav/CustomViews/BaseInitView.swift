import UIKit

class BaseInitView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        addSubviews()
        setupConfiguration()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        addSubviews()
        setupConfiguration()
        setupConstraints()
    }
    
    func setView() {
    }
    
    func addSubviews() {
    }
    
    func setupConfiguration() {
    }
    
    func setupConstraints() {
    }
}
