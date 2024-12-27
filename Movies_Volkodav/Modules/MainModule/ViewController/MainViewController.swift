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
        setupSearchBar()
        setupFilterButton()
        setupSortingOption()
        setupRefreshAction()
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.contentView.reloadCollectionView()
        }
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
    
    private func setupSearchBar() {
        contentView.setSearchBar(delegate: self)
    }
    
    private func setupFilterButton() {
        contentView.setupFilterButton { [weak self] in
            guard let self = self else { return }
            self.viewModel.showSortingOptions(from: self)
        }
    }
    
    private func setupSortingOption() {
        viewModel.onSortingOptionSelected = { [weak self] selectedOption in
            guard let self = self else { return }
            reloadCollectionView()
        }
    }
    
    private func setupRefreshAction() {
        contentView.refreshAction = { [weak self] in
            guard let self = self else { return }
            viewModel.resetMovies()
            startLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                guard let self = self else { return }
                self.contentView.endRefreshing()
            }
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = MainViewController()
    return view
}
