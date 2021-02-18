import UIKit

extension UIButton {
    
    var title: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    var titleColor: UIColor? {
        get {
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    convenience init(title: String?, titleColor: UIColor?) {
        self.init()
        self.title = title
        self.titleColor = titleColor
    }
}
