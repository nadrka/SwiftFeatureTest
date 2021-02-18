import UIKit

final class SplitVC: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        let menuVC = MenuController(style: .plain)
        let nvc = UINavigationController(rootViewController: menuVC)
        let detailsVC = DetailsViewController()
        menuVC.delegate = detailsVC
        detailsVC.view.backgroundColor = .lightGray
        viewControllers = [nvc, UINavigationController(rootViewController: detailsVC)]
    }
    
    private func setupView2() {
        view.backgroundColor = .red
        let menuVC = MenuController(style: .plain)
        let nvc = UINavigationController(rootViewController: menuVC)
        let detailsVC = DetailsViewController()
        menuVC.delegate = detailsVC
        detailsVC.view.backgroundColor = .lightGray
        viewControllers = [nvc, UINavigationController(rootViewController: detailsVC)]
    }
}


protocol MonsterSelectionDelegate: class {
    func monsterSelected(_ newMonster: String)
}


// MARK: DetailsViewController

final class DetailsViewController: UIViewController {
    
    @UsesAutoLayout
    private var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let constraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}

extension DetailsViewController: MonsterSelectionDelegate {
   func monsterSelected(_ newMonster: String) {
        label.text = newMonster
    }
}

// MARK: MenuVieController

final class MenuController: UITableViewController {
    weak var delegate: MonsterSelectionDelegate?
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "Option \(indexPath.row)"
        if indexPath.row % 2 == 0 {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let x = "Option \(indexPath.row)"
        
        delegate?.monsterSelected(x)
//        if let detailViewController = delegate as? DetailsViewController,
//          let detailNavigationController = detailViewController.navigationController {
//            splitViewController?.
//        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory type in row: \(indexPath.row)")
    }
}



protocol Asd {
    func ham(x: Int)
}

extension Asd {
    func ham(x: Int = 0) {
        return ham(x: x)
    }
}

class Bsd: Asd {
    func ham(x: Int = 0) {
        print("asd")
    }
}

class Csd {
    
}



