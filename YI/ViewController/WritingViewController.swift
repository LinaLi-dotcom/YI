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
    
    var currentChar = ""
    let canvas = Canvas()
    
    @IBOutlet weak var meanLabel: UILabel!
    @IBAction func speakButton(_ sender: UIButton) {
        speak()
    }
    
    func speak(){
      
        let utterance = AVSpeechUtterance(string: currentChar)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        drawView.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = drawView.bounds
        charLabel.text = currentChar
    }
    


    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ClearButton(_ sender: UIButton) {
        canvas.clearCanvas()
    }
    
}
