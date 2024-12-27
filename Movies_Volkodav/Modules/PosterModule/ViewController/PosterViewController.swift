import UIKit

final class PosterViewController: UIViewController {
    
    private let contentView = PosterContentView()
    let viewModel = PosterViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosterImage()
        setupCloseButton()
    }
    
    private func loadPosterImage() {
        let selectedPoster = viewModel.posterUrl
        contentView.loadPosterImage(from: selectedPoster)
    }
    
    private func setupCloseButton() {
        contentView.closeAction = { [weak self] in
            guard let self = self else { return }
            viewModel.goBack()
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = PosterViewController()
    return view
}
