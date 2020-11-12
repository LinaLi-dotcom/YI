//
//  ViewController.swift
//  YI
//
//  Created by Lina Li on 2020-09-30.
//

import UIKit
import Firebase
import FirebaseStorage



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
 
    @IBOutlet weak var firebaseimageview: UIImageView!
    
    
    /*var drawChars = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        FirstTableView.dataSource = self
        FirstTableView.delegate = self
        
        drawChars.append("豆")
        drawChars.append("恶")
        drawChars.append("如")
        drawChars.append("犬")
        drawChars.append("香")
        drawChars.append("比")
    }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return drawChars.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = FirstTableView.dequeueReusableCell(withIdentifier: "Raden", for: indexPath) as! FirstTableViewCell
            cell.FirstText.text = drawChars[indexPath.row]
            return cell
        }*/
        
    
        
      // Get a reference to the storage service using the default Firebase App
               /* let storage = Storage.storage()

                // Create a storage reference from our storage service
                let storageRef = storage.reference()
                
                let myimagesRef = storageRef.child("comedyphoto_Julian_Rad.jpg")
                
                // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                myimagesRef.getData(maxSize: 1 * 1024 * 1024 ) { data, error in
        //          kolla om error in är null
                    if let error = error {
                    // Uh-oh, an error occurred!
                  } else {
                    // Data for "images/island.jpg" is returned
                    let gottenimage = UIImage(data: data!)
                    self.firebaseimageview.image = gottenimage
                  }
                }

    }
    
//    from categorytableview to character viewcontroller
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
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
         
    }
}
   
    


}*/
