import UIKit

final class MainContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    private let searchBar = UISearchBar()
    private let collectionView = MainCollectionView()
    private let loaderView = LoaderView()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(navigationView)
        addSubview(searchBar)
        addSubview(collectionView)
        addSubview(loaderView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setupFilterButton(_ action: (() -> Void)?) {
        navigationView.rightButtonAction = action
    }
    
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            loaderView.startRotating()
        } else {
            loaderView.stopRotating()
        }
    }
    
    func setCollectionView(dataSource: UICollectionViewDataSource,
                           delegate: UICollectionViewDelegate) {
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
//MARK: - setupConfiguration
private extension MainContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configSearchBar()
        configCollectionView()
    }
    
    func configNavigationView() {
        navigationView.configureNavigation(leftHidden: true,
                                           rightHidden: false)
    }
    
    func configSearchBar() {
        searchBar.placeholder = "Search"
    }
    
    func configCollectionView() {
        collectionView.register(MovieCell.self,
                                forCellWithReuseIdentifier: MovieCell.reuseIdentifier)
        collectionView.backgroundColor = .white
    }
}
//MARK: - setupConstraints
private extension MainContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
        setupSearchBarConstraints()
        setupCollectionViewConstraints()
        setupLoaderViewConstraints()
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
    
    func setupSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupLoaderViewConstraints() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            loaderView.heightAnchor.constraint(equalToConstant: 100),
            loaderView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
