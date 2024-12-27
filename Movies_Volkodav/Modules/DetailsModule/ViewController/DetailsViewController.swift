import UIKit

final class DetailsViewController: UIViewController {
    
    private let contentView = DetailsContentView()
    let viewModel = DetailsViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setupTrailerButton()
        setupBackButton()
        setupPosterTapAction()
    }
    
    private func startLoading() {
        viewModel.loadDetails()
        viewModel.$isLoading.bind { [weak self] isLoading in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.setLoading(isLoading)
                self.viewModel.showAlertIfNeeded(on: self)
                self.setupSelectedMovie()
            }
        }
    }
    
    private func setupSelectedMovie() {
        let details = viewModel.setDetails()
        contentView.setDetails(movieTitle: details.movieTitle,
                               imageUrl: details.imageUrl,
                               country: details.country,
                               year: details.year,
                               genre: details.genre,
                               trailerUrl: details.trailerUrl,
                               rating: details.rating,
                               description: details.description)        
    }
    
    private func setupBackButton() {
        contentView.setupBackButton { [weak self] in
            guard let self = self else { return }
            viewModel.goBackToMain()
        }
    }
    
    private func setupPosterTapAction() {
        contentView.posterTapAction = { [weak self] in
            guard let self = self else { return }
            viewModel.runPoster()
        }
    }
    
    private func setupTrailerButton() {
        contentView.trailerButtonAction = { [weak self] in
            guard let self = self else { return }
            print("Open trailer")
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = DetailsViewController()
    return view
}
