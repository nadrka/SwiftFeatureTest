//
//  ViewController.swift
//  SwiftFeatureTest
//
//  Created by karol.nadratowski on 12/02/2021.
//  Copyright © 2021 karol.nadratowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @UsesAutoLayout
    private var redView = UIView()
    
    @UsesAutoLayout
    private var blueView = UIView()
    
    @UsesAutoLayout
    private var greenView = UIView()
    
    private var yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        
        view.backgroundColor = .white
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        
        view.addSubview(redView)
        view.addSubview(blueView)
        redView.addSubview(greenView)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let x = blueView.topAnchor.constraint(equalTo: redView.topAnchor)
        x.priority = .almostRequired
        
        let y = blueView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10)
        y.priority = .notRequired
        
        let constraints = [
            redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            
            blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            blueView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            
            greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            greenView.centerYAnchor.constraint(equalTo: redView.centerYAnchor),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.5),
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor),
        ]
   
        NSLayoutConstraint.activate(constraints)
    }
    
    // Test SplitViewController
    // Use Auto Layouts
    // Do some cool animations (maybe tinder?)
    // Experiment with CollectionView
    // Test CollectionViewDiffidable data source

}


extension NSLayoutConstraint {
    
    /// Returns the constraint sender with the passed priority.
    ///
    /// - Parameter priority: The priority to be set.
    /// - Returns: The sended constraint adjusted with the new priority.
    func usingPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
    
}

extension UILayoutPriority {
    
    /// Creates a priority which is almost required, but not 100%.
    static var almostRequired: UILayoutPriority {
        return UILayoutPriority(rawValue: 999)
    }
    
    /// Creates a priority which is not required at all.
    static var notRequired: UILayoutPriority {
        return UILayoutPriority(rawValue: 1)
    }
}

@propertyWrapper
struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}

final class MyViewController {
    @UsesAutoLayout
    var label = UILabel()
}
