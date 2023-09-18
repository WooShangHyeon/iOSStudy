//
//  SymballRollerViewController.swift
//  symballRoller
//
//  Created by 우상현 on 2023/09/17.
//

import UIKit

class SymballRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reload()
        button.tintColor = UIColor.systemPink
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        
        imageView.image = UIImage(systemName: symbol)
        
        label.text = symbol
    }
    @IBAction func buttonClick(_ sender: Any) {
        reload()
    }
}
