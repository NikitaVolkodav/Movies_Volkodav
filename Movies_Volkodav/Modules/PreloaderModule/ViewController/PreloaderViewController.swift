import UIKit

final class PreloaderViewController: UIViewController {
    
    private let contentView = PreloaderContentView()
    let viewModel = PreloaderViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    deinit {
        contentView.stopLoaderView()
    }
    
    private func bindViewModel() {
        viewModel.startPreloaderTimer()
    }
}
