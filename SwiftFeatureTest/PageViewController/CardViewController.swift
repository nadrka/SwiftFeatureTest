import UIKit

class CardViewController: UIViewController {
    var pageIndex: Int?
    var petCard: PetCard?
    
    @UsesAutoLayout
    private var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 5
        return view
    }()
    
    @UsesAutoLayout
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = petCard?.description
        print("helko")
        applyContstraints()
    }
    
    private func applyContstraints() {
        view.addSubview(cardView)
        cardView.addSubview(titleLabel)
        
        let constraints = [
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            cardView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.9)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
