import UIKit

final class TinderCardsViewController: UIViewController {
    
    @UsesAutoLayout
    private var cardView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = .lightGray
        
        view.addSubview(cardView)
        
        let drageGesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag))
        cardView.addGestureRecognizer(drageGesture)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let constraints = [
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 475),
            cardView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func handleDrag(_ gestureRecognizer : UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            print("began")
            break
        case .changed:
            let translation = gestureRecognizer.translation(in: view)
            updateTranslation(point: translation)
            break
        case .cancelled:
            break
        case .ended:
            moveToBeginig()
            print("ended")
            break
        @unknown default:
            break
        }
    }
    
    private func updateTranslation(point: CGPoint) {
        let transformation = CGAffineTransform.identity
        transformation.translatedBy(x: point.x, y: point.y)
        cardView.transform = CGAffineTransform(translationX: point.x, y: point.y).rotated(by: -(point.x / 1000))
    }
    
    private func moveToBeginig() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.cardView.transform = .identity
        })
    }
    
}
