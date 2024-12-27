import UIKit

final class LoaderView: UIImageView {

    func startRotating(duration: Double = 3.0,
                       imageName: String = "circle.dashed",
                       color: UIColor = .black) {
        self.isHidden = false
        let systemImage = UIImage(systemName: imageName)?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(color)
        image = systemImage
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = duration
        rotation.repeatCount = .infinity
        
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func stopRotating() {
        self.layer.removeAnimation(forKey: "rotationAnimation")
        self.isHidden = true
    }
}
