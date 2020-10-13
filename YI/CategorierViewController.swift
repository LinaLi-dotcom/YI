//
//  CategorierViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-05.
//

import UIKit

class CategorierViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var LäggtillTextField: UITextField!
    @IBOutlet weak var CategoryTableView: UITableView!
    
    var category = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryTableView.delegate = self
        CategoryTableView.dataSource = self

        category.append("The Strokes of Chinese Character")
        category.append("Simple Radicals")
        category.append("Nummers")
        category.append("Time-Related")
        category.append("Simple Terms")
        category.append("Other Common characters")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raden", for: indexPath) as! CategoryTableViewCell
        cell.FirstCategory.text = category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (category.count == 0)
        {
            return
        }
        let categoryItem = category[indexPath.row]
        
        performSegue(withIdentifier: "showChar", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CharViewController
       
        dest.charCategory = sender as! Int
        
    }
   
    @IBAction func läggtillKnappen(_ sender: Any) {
    }
}


//    from categorytableview to loginRegisterviewcontroller
    
    /*override func viewWillAppear(_ animated: Bool) {
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if (Auth.auth().currentUser == nil){
            
        performSegue(withIdentifier: "gologin", sender: nil)
        } else {
            print (Auth.auth().currentUser?.uid)
            loadView()
        }
        }
    
    @IBAction func logutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "gologin", sender: nil)
        } catch {
            
        }
         
    } */
