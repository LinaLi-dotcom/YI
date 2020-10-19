//
//  CharViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-11.
//

import UIKit

class CharViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

{

    var charList = [String]()
    
    /*
    var theStrokes = [String]()
    var simpleRadicals = [String]()
    var chineseNumbers = [String] ()
    var timeRelated = [String]()
    var simpleTerms = [String]()
    var commonlyUsedCharacters = [String]()
     */
    
    @IBOutlet weak var CharCollectionView: UICollectionView!
    
    var charCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CharCollectionView.dataSource = self
        CharCollectionView.delegate = self
        
        if(charCategory == 0)
        {
            charList.append("一")
            charList.append("丨")
            charList.append("、")
            charList.append("丿")
            charList.append("丶")
            charList.append("亅")
            charList.append("乙")
        }
        
        if (charCategory == 1 )
        {
            charList.append("十")
            charList.append("人")
            charList.append("儿")
            charList.append("厂")
            charList.append("又")
            charList.append("刀")
            charList.append("几")
            charList.append("大")
            charList.append("小")
            charList.append("子")
            charList.append("口")
            charList.append("门")
            charList.append("广")
            charList.append("飞")
            charList.append("工")
            charList.append("干")
            charList.append("土")
            charList.append("士")
           
            
        }
        
        if(charCategory == 2)
        {
            charList.append("一")
            charList.append("二")
            charList.append("三")
            charList.append("四")
            charList.append("五")
            charList.append("六")
            charList.append("七")
            charList.append("八")
            charList.append("九")
            charList.append("十")

        }

        
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return charList.count
    
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharCell", for: indexPath) as! CharCollectionViewCell
       
        cell.theCharLabel.text = charList [indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let clickedChar = charList[indexPath.item]
        
        print(clickedChar)
        
        performSegue(withIdentifier: "goWrite", sender: clickedChar)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! WritingViewController
        dest.currentChar = sender as! String
    }
    
}

