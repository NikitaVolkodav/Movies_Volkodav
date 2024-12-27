import UIKit

class BaseView: UIView {
    
    func getHeightConstant(smallHeight: CGFloat, largeHeight: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height <= 667 ? smallHeight : largeHeight
    }
}
