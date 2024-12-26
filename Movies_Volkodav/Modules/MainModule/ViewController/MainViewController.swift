import UIKit

final class MainViewController: UIViewController {
    
    private let contentView = MainContentView()
    let viewModel = MainViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setupCollectionView()
        setupFilterButton()
    }
    
    private func startLoading() {
        viewModel.loadMovies()
        viewModel.$isLoading.bind { [weak self] isLoading in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.setLoading(isLoading)
                self.contentView.reloadCollectionView()
            }
        }
    }
    
    private func setupCollectionView() {
        contentView.setCollectionView(dataSource: self,
                                      delegate: self)
    }
    
    private func setupFilterButton() {
        contentView.setupFilterButton { [weak self] in
            guard let self = self else { return }
            print("Open Alert")
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = MainViewController()
    return view
}
