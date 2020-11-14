//
//  HomeViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-15.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeTextView: UILabel!
    
    @IBOutlet weak var startBnt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        startBnt.layer.cornerRadius = 20
        startBnt.layer.borderWidth = 3
       
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
