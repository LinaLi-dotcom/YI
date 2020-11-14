//
//  CategorierViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-05.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var CategoryTableView: UITableView!
    
    var category = [String] ()
    
    var colors = [Color(name: "lightskyblue", uiColor: UIColor(red: 0.76, green: 0.84, blue: 0.86, alpha: 1.00)),
                  Color(name: "skyblue", uiColor: UIColor(red: 0.66, green: 0.78, blue: 0.80, alpha: 1.00)),
                  Color(name: "lightskincolor", uiColor: UIColor(red: 0.97, green: 0.97, blue: 0.94, alpha: 1.00)),
                  Color(name: "skincolor", uiColor: UIColor(red: 0.82, green: 0.79, blue: 0.78, alpha: 1.00)),
                  Color(name: "purple", uiColor: UIColor.lightGray),
                  Color(name: "brown", uiColor: UIColor.brown)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryTableView.delegate = self
        CategoryTableView.dataSource = self

        category.append("Numbers")
        category.append("Strokes")
        category.append("Radicals")
        category.append("Time")
        category.append("Characters")
        category.append("Terms")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raden", for: indexPath) as! CategoryTableViewCell
        cell.categoryLabel?.text = category[indexPath.row]
        cell.backgroundColor = colors[indexPath.row].uiColor
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if (category.count == 0)
        {
            return
        }
        _ = category[indexPath.row]
        
        
        performSegue(withIdentifier: "showChar", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let nav = segue.destination as! UINavigationController
        let svc = nav.topViewController as! CharViewController
//        svc.toPassSearchKeyword = searchKeyword
//
//        let dest = segue.destination as! CharViewController
        svc.charCategory = sender as! Int
        
    }
   
    @IBAction func Back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
