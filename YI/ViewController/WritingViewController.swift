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
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    
    
    //    override func draw(_ rect: CGRect) {
////        custom drawing
//        super.draw(rect)
//
//        guard let context = UIGraphicsGetCurrentContext() else
//        {return}
//
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.setLineWidth(10)
//        context.setLineCap(.butt)
//
//        lines.forEach {(line) in
//        for (i, p) in line.enumerated(){
//            if i == 0{
//                context.move(to: p)
//            } else{
//                context.addLine(to: p)
//            }
//        }
//        }
//
//        context.strokePath()
//
//    }
//
//    //    var line = [CGPoint] ()
//        var lines = [[CGPoint]] ()
//
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            lines.append([CGPoint] ())
//        }
//
//    //    track the finger as we move across screen
//        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//            guard let point = touches.first?.location(in: self) else {return}
//    //        print(point)
//
//            guard var lastLine = lines.popLast() else {return}
//            lastLine.append(point)
//            lines.append(lastLine)
//
//    //        var lastLine = lines.last
//    //        lastline.append(point)
//    //
//    //
//    //        line.append(point)
//
//            setNeedsDisplay()
//        }
    @IBAction func clearButton(_ sender: Any) {
    }
}



class WritingViewController: UIViewController {
    
    @IBOutlet weak var drawView: UIView!
    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    
    var currentChar = ""
    let canvas = Canvas()
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
////        speechService.say("yi")
//    }
    
    @IBAction func speakButton(_ sender: UIButton) {
        
        speak()
        
    }
    
    func speak(){
//        let  voice = AVSpeechSynthesisVoice(identifier: "zh-CH")
//        let  toread = AVSpeechUtterance(string: "currentChar")
//        toread.voice = voice
        
        
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
    
    @IBAction func goback(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
}
