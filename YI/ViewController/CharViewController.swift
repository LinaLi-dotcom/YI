//
//  CharViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-11.
//

import UIKit

class DrawChar
{
    var char = ""
    var meaning = ""
    var pinyin = ""
    
    init(ch : String, me : String, pi : String) {
        self.char = ch
        self.meaning = me
        self.pinyin = pi
    }
}

class CharViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var chars = [DrawChar]()
    //
    //    var charList = [String] ()
    
    @IBOutlet weak var CharCollectionView: UICollectionView!
    
    var charCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharCollectionView.dataSource = self
        CharCollectionView.delegate = self
        
        if(charCategory == 0)
        {
            chars.append(DrawChar(ch: "一", me: "One", pi: "yī"))
            chars.append(DrawChar(ch: "二", me: "Two", pi: "èr"))
            chars.append(DrawChar(ch: "三", me: "Three", pi: "sān"))
            chars.append(DrawChar(ch: "四", me: "Four", pi: "sì"))
            chars.append(DrawChar(ch: "五", me: "Five", pi: "wǔ"))
            chars.append(DrawChar(ch: "六", me: "Six", pi: "liù"))
            chars.append(DrawChar(ch: "七", me: "Seven", pi: "qī"))
            chars.append(DrawChar(ch: "八", me: "Eight", pi: "bā"))
            chars.append(DrawChar(ch: "九", me: "Nine", pi: "jiǔ"))
            chars.append(DrawChar(ch: "十", me: "Ten", pi: "shí"))
            
        }
        
        
        if(charCategory == 1)
        {
        
            chars.append(DrawChar(ch: "一", me: "No meaning", pi: "héng"))
            chars.append(DrawChar(ch: "丨", me: "No meaning", pi: "shù"))
            chars.append(DrawChar(ch: "、", me: "No meaninig", pi: "diǎn"))
            chars.append(DrawChar(ch: "丿", me: "No meaning", pi: "piě"))
            chars.append(DrawChar(ch: "亅", me: "No meaning", pi: "shù goū"))
            chars.append(DrawChar(ch: "乙", me: "No meaning", pi: "yǐ"))
        }
        
        if (charCategory == 2 )
        {
            
            chars.append(DrawChar(ch: "人", me: "People", pi: "rén"))
            chars.append(DrawChar(ch: "儿", me: "Son", pi: "ér"))
            chars.append(DrawChar(ch: "厂", me: "Factory", pi: "chǎng"))
            chars.append(DrawChar(ch: "广", me: "Broad", pi: "guǎng"))
            chars.append(DrawChar(ch: "又", me: "Again", pi: "yoù"))
            chars.append(DrawChar(ch: "刀", me: "Knife", pi: "dāo"))
            chars.append(DrawChar(ch: "几", me: "Several", pi: "jǐ"))
            chars.append(DrawChar(ch: "大", me: "Big", pi: "dà"))
            chars.append(DrawChar(ch: "小", me: "Small", pi: "xiǎo"))
            chars.append(DrawChar(ch: "子", me: "Child", pi: "zǐ"))
            chars.append(DrawChar(ch: "口", me: "Mouth", pi: "koǔ"))
            chars.append(DrawChar(ch: "日", me: "Day or Sun", pi: "rì"))
            chars.append(DrawChar(ch: "月", me: "Moon", pi: "yuè"))
            chars.append(DrawChar(ch: "白", me: "White", pi: "bái"))
            chars.append(DrawChar(ch: "目", me: "Eyes", pi: "mù"))
            chars.append(DrawChar(ch: "田", me: "Farm", pi: "tián"))
            chars.append(DrawChar(ch: "门", me: "Door", pi: "mén"))
            chars.append(DrawChar(ch: "飞", me: "Fly", pi: "fēi"))
            chars.append(DrawChar(ch: "工", me: "Work", pi: "gōng"))
            chars.append(DrawChar(ch: "干", me: "Do", pi: "gàn"))
            chars.append(DrawChar(ch: "王", me: "King", pi: "wáng"))
            chars.append(DrawChar(ch: "玉", me: "Jade", pi: "yù"))
            chars.append(DrawChar(ch: "土", me: "Earth", pi: "tǔ"))
            chars.append(DrawChar(ch: "比", me: "Compare", pi: "bǐ"))
            chars.append(DrawChar(ch: "长", me: "Long", pi: "cháng"))
            chars.append(DrawChar(ch: "车", me: "Car", pi: "chē"))
            chars.append(DrawChar(ch: "父", me: "Father", pi: "fù"))
            chars.append(DrawChar(ch: "火", me: "Fire", pi: "huǒ"))
            chars.append(DrawChar(ch: "毛", me: "Hair", pi: "máo"))
            chars.append(DrawChar(ch: "木", me: "Wood", pi: "mù"))
            chars.append(DrawChar(ch: "牛", me: "Cow", pi: "niú"))
            chars.append(DrawChar(ch: "手", me: "Hand", pi: "shǒu"))
            chars.append(DrawChar(ch: "水", me: "Water", pi: "shǔi"))
            chars.append(DrawChar(ch: "心", me: "Heart", pi: "xīn"))
        
           }
            
            if (charCategory == 3 )
            {
                
                chars.append(DrawChar(ch: "一月", me: "January", pi: "yī yuè"))
                chars.append(DrawChar(ch: "二月", me: "February", pi: "èr yuè"))
                chars.append(DrawChar(ch: "三月", me: "March", pi: "sān yuè"))
                chars.append(DrawChar(ch: "四月", me: "April", pi: "sì yuè"))
                chars.append(DrawChar(ch: "五月", me: "May", pi: "wǔ yuè"))
                chars.append(DrawChar(ch: "六月", me: "June", pi: "liù yuè"))
                chars.append(DrawChar(ch: "七月", me: "July", pi: "qī yuè"))
                chars.append(DrawChar(ch: "八月", me: "August", pi: "bā yuè"))
                chars.append(DrawChar(ch: "九月", me: "September", pi: "jiǔ yuè"))
                chars.append(DrawChar(ch: "十月", me: "October", pi: "shí yuè"))
                chars.append(DrawChar(ch: "十一月", me: "November", pi: "shí yī yuè"))
                chars.append(DrawChar(ch: "十二月", me: "December", pi: "shí èr yuè"))
                
                chars.append(DrawChar(ch: "星期一", me: "Monday", pi: "xīngqí yī"))
                chars.append(DrawChar(ch: "星期二", me: "Thuesday", pi: "xīngqí èr"))
                chars.append(DrawChar(ch: "星期三", me: "Wednesday", pi: "xīngqí sān"))
                chars.append(DrawChar(ch: "星期四", me: "Thursday", pi: "xīngqí sì"))
                chars.append(DrawChar(ch: "星期五", me: "Friday", pi: "xīngqí sì"))
                chars.append(DrawChar(ch: "星期六", me: "Saturday", pi: "xīngqí liù"))
                chars.append(DrawChar(ch: "星期日", me: "Sunday", pi: "xīngqí rì"))
            
            }
            
            if (charCategory == 4 )
            {
                
                chars.append(DrawChar(ch: "你", me: "You", pi: "nǐ"))
                chars.append(DrawChar(ch: "们", me: "They", pi: "mén"))
                chars.append(DrawChar(ch: "他", me: "He", pi: "tā"))
                chars.append(DrawChar(ch: "她", me: "She", pi: "tā"))
                chars.append(DrawChar(ch: "这", me: "This", pi: "zhè"))
                chars.append(DrawChar(ch: "那", me: "That", pi: "nà"))
                chars.append(DrawChar(ch: "哪", me: "Where", pi: "nǎ"))
                chars.append(DrawChar(ch: "和", me: "And", pi: "hé"))

            }
            if (charCategory == 5 )
            {
                
                chars.append(DrawChar(ch: "妈妈", me: "Mother", pi: "māmā"))
                chars.append(DrawChar(ch: "爸爸", me: "Father", pi: "bàbà"))
                chars.append(DrawChar(ch: "儿子", me: "Son", pi: "ér zi"))
                chars.append(DrawChar(ch: "女儿", me: "Daughter", pi: "nǚ ér"))
                chars.append(DrawChar(ch: "学生", me: "Student", pi: "xué shēng"))
                chars.append(DrawChar(ch: "同学", me: "Classmate", pi: "tóng xué"))
                chars.append(DrawChar(ch: "朋友", me: "Friend", pi: "péng you"))
                chars.append(DrawChar(ch: "医生", me: "Docter", pi: "yī shēng"))
                chars.append(DrawChar(ch: "先生", me: "Mr.", pi: "xiān shēng"))
                chars.append(DrawChar(ch: "小姐", me: "Miss.", pi: "xiǎo jiě"))
                chars.append(DrawChar(ch: "天气", me: "Weather", pi: "tiān qì"))
                chars.append(DrawChar(ch: "东西", me: "Thing", pi: "dōng xī"))
                chars.append(DrawChar(ch: "汉语", me: "Chinese", pi: "hàn yǔ"))
                chars.append(DrawChar(ch: "再见", me: "Goodbye", pi: "zài jiàn"))
                chars.append(DrawChar(ch: "认识", me: "Know", pi: "rèn shí"))
             
            }
            
        }
        
        
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return chars.count
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharCell", for: indexPath) as! CharCollectionViewCell
            if let text = cell.theCharLabel {
                text.text = chars[indexPath.row].char
            } else
            {
//                error
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let clickedDrawChar = chars[indexPath.item]
            
            performSegue(withIdentifier: "goWrite", sender: clickedDrawChar)
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination as! WritingViewController
            dest.currentDrawChar = sender as! DrawChar
        }
        
        @IBAction func BackButton(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    

