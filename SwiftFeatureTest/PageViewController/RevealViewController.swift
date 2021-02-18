import UIKit


class RevealViewController: UIViewController {
    var petCard: PetCard?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var dismissButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        titleLabel.text = petCard?.name
        imageView.image = petCard?.image
        applyConstraints()
    }
    
    private func applyConstraints() {
        
    }
}
