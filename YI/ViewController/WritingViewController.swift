//
//  WritingViewController.swift
//  YI
//
//  Created by Lina Li on 2020-10-16.
//

import UIKit
import AVFoundation

class Canvas: UIView{
    
    override func draw(_ rect: CGRect) {
//        custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        {return}
        
//        here are my lines
//        dummy data
        /*
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 100, y: 100)
        
        context.move(to: startPoint)
         context.addLine(to: endPoint)*/
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach {(line) in
        for (i, p) in line.enumerated(){
            if i == 0{
                context.move(to: p)
            } else{
                context.addLine(to: p)
            }
        }
        }
        
        context.strokePath()
        
    }
        
    //    var line = [CGPoint] ()
        var lines = [[CGPoint]] ()
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            lines.append([CGPoint] ())
        }
        
    //    track the finger as we move across screen
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            guard let point = touches.first?.location(in: nil) else {return}
    //        print(point)
          
            guard var lastLine = lines.popLast() else {return}
            lastLine.append(point)
            lines.append(lastLine)
            
    //        var lastLine = lines.last
    //        lastline.append(point)
    //
    //
    //        line.append(point)
            
            setNeedsDisplay()
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
        let  voice = AVSpeechSynthesisVoice(identifier: "zh-CH")
        let  toread = AVSpeechUtterance(string: "currentChar")
        toread.voice = voice
        
//        func speakPinyin()
       ////        {
       ////         let utterance = AVSpeechUtterance(string: pinyinlist)
       ////            self.utterance.voice = AVSpeechSynthesisVoice(language: "ch-CH")
       ////            self.utterance.rate = 0.1
       ////
       ////         let synthesizer = AVSpeechSynthesizer()
       ////            self.ynthesizer.speak(utterance)
        
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        drawView.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = drawView.frame
        charLabel.text = currentChar
    }
   
}
