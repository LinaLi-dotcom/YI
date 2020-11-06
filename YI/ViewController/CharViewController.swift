//
//  CharViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-11.
//

import UIKit

class CharViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var charList = [String] ()
    
    @IBOutlet weak var CharCollectionView: UICollectionView!
    
    var charCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharCollectionView.dataSource = self
        CharCollectionView.delegate = self
        
        if(charCategory == 0)
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


        if(charCategory == 1)
        {
            charList.append("一")
            charList.append("丨")
            charList.append("、")
            charList.append("丿")
            charList.append("丶")
            charList.append("亅")
            charList.append("乙")
        }
        
        if (charCategory == 2 )
        {
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
            charList.append("日")
            charList.append("月")
            charList.append("白")
            charList.append("目")
            charList.append("白")
            charList.append("田")
            charList.append("门")
            charList.append("广")
            charList.append("飞")
            charList.append("工")
            charList.append("干")
            charList.append("王")
            charList.append("玉")
            charList.append("土")
            charList.append("比")
            charList.append("长")
            charList.append("车")
            charList.append("父")
            charList.append("火")
            charList.append("毛")
            charList.append("木")
            charList.append("牛")
            charList.append("手")
            charList.append("水")
            charList.append("心")
         }

        if (charCategory == 3 )
        {
            charList.append("一月")
            charList.append("二月")
            charList.append("三月")
            charList.append("四月")
            charList.append("五月")
            charList.append("六月")
            charList.append("七月")
            charList.append("八月")
            charList.append("九月")
            charList.append("十月")
            charList.append("十一月")
            charList.append("十二月")

            charList.append("星期一")
            charList.append("星期二")
            charList.append("星期三")
            charList.append("星期四")
            charList.append("星期五")
            charList.append("星期六")
            charList.append("星期日")
        }

        if (charCategory == 4 )
        {
            charList.append("你")
            charList.append("们")
            charList.append("他")
            charList.append("她")
            charList.append("这")
            charList.append("他")
            charList.append("她")
            charList.append("这")
            charList.append("那")
            charList.append("哪")
            charList.append("和")
        }
        if (charCategory == 5 )
        {
            charList.append("妈妈")
            charList.append("爸爸")
            charList.append("儿子")
            charList.append("女儿")
            charList.append("学生")
            charList.append("同学")
            charList.append("朋友")
            charList.append("医生")
            charList.append("先生")
            charList.append("小姐")
            charList.append("天气")
            charList.append("东西")
            charList.append("汉语")
            charList.append("再见")
            charList.append("认识")
        }
            
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
    
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


