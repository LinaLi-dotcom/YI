//
//  WritingViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-16.
//

import UIKit

class WritingViewController: UIViewController {

    var currentChar = ""
    
    @IBOutlet weak var charLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        charLabel.text = currentChar
    }
    


}
