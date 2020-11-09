//
//  WritingViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-16.
//

import UIKit
import AVFoundation

class Canvas: UIView{
    
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
    override func layoutSubviews() {
        
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        
        lineColor = UIColor.red
        lineWidth = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer (){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas()
    {
        if path != nil {
            path.removeAllPoints()
            self.layer.sublayers = nil
            self.setNeedsDisplay()}
        else{
            
        }
    }
    
}

class WritingViewController: UIViewController {
    
    @IBOutlet weak var drawView: UIView!
    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var meanLabel: UILabel!
    @IBOutlet weak var pinyinLabel: UILabel!
    
    
    var currentDrawChar : DrawChar!
    let canvas = Canvas()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        charLabel.text = currentDrawChar.char
        meanLabel.text = currentDrawChar.meaning
        pinyinLabel.text = currentDrawChar.pinyin
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        drawView.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = drawView.bounds
    }
    
    
    
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ClearButton(_ sender: UIButton) {
        canvas.clearCanvas()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let image = drawView.takeScreenShot()
        UIImageWriteToSavedPhotosAlbum(image, self,  #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
     
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer){
        if error != nil{
            print("Unable to save the image into the photos")
        }else{
            print("Image saved into the photos")
        }
        
    }
    
    @IBAction func speakButton(_ sender: UIButton) {
        speak()
    }
    
    func speak(){
        
        let utterance = AVSpeechUtterance(string: currentDrawChar.char)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }
}

extension UIView {
  
    func takeScreenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        if image != nil{
        return image!
        }
        return UIImage()
        
    }

}
