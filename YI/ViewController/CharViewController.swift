//
//  CharViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-11.
//

import UIKit

class CharViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

{

    
    var theStrokes = [String]()
    var simpleRadicals = [String]()
    var chineseNumbers = [String] ()
    var timeRelated = [String]()
    var simpleTerms = [String]()
    var commonlyUsedCharacters = [String]()
     
    @IBOutlet weak var CharCollectionView: UICollectionView!
    
    var charCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CharCollectionView.dataSource = self
        CharCollectionView.delegate = self
        
        if(charCategory == 0)
        {
            theStrokes.append("一")
            theStrokes.append("丨")
            theStrokes.append("、")
            theStrokes.append("丿")
            theStrokes.append("丶")
            theStrokes.append("亅")
            theStrokes.append("乙")
        }
        
        if (charCategory == 1 )
        {
            simpleRadicals.append("十")
            simpleRadicals.append("人")
            simpleRadicals.append("儿")
            simpleRadicals.append("厂")
            simpleRadicals.append("又")
            simpleRadicals.append("刀")
            simpleRadicals.append("几")
            simpleRadicals.append("大")
            simpleRadicals.append("小")
            simpleRadicals.append("子")
            simpleRadicals.append("口")
            simpleRadicals.append("门")
            simpleRadicals.append("广")
            simpleRadicals.append("飞")
            simpleRadicals.append("工")
            simpleRadicals.append("干")
            simpleRadicals.append("土")
            simpleRadicals.append("士")
            
            
        }
        
        if(charCategory == 2)
        {
            chineseNumbers.append("一")
            chineseNumbers.append("二")
            chineseNumbers.append("三")
            chineseNumbers.append("四")
            chineseNumbers.append("五")
            chineseNumbers.append("六")
            chineseNumbers.append("七")
            chineseNumbers.append("八")
            chineseNumbers.append("九")
            chineseNumbers.append("十")
        }

        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (section == 0)
        {
            return theStrokes.count
        }
        if (section == 1)
        {
            return simpleRadicals.count
        }
        if (section == 2)
        {
            return chineseNumbers.count
        }
        
        return 0
    
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharCell", for: indexPath) as! CharCollectionViewCell
       
        if (indexPath.section == 0)
        {
            cell.theCharLabel.text = theStrokes[indexPath.item]
        }
        if (indexPath.section == 1)
        {
            cell.theCharLabel.text = simpleRadicals [indexPath.item]
        }
        if (indexPath.section == 2)
        {
            cell.theCharLabel.text = chineseNumbers [indexPath.item]
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let clickedChar = chineseNumbers[indexPath.item]
        
        print(clickedChar)
        
    }*/
    
}

