import UIKit
import Kingfisher

final class KingfisherImageView: UIImageView {

    func loadImage(from urlString: String?,
                   defaultImage: UIImage?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = defaultImage
            return
        }

        let options: KingfisherOptionsInfo = [
            .cacheOriginalImage,
            .fromMemoryCacheOrRefresh
        ]

        self.kf.indicatorType = .activity

        self.kf.setImage(with: url, options: options) { result in
            switch result {
            case .success(let value):
                self.image = value.image
            case .failure:
                self.image = defaultImage
            }
        }
    }
}
