//
//  DrawView.swift
//  xcPaint
//
//  Created by Stringham on 12/1/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import Foundation
import UIKit

class Drawview: UIView{
    var isStroke = false
    var endPoint: CGPoint!
    var lineColor: CGColor = UIColor.black.cgColor
    var lines = [Line]()
    var lineSize: CGFloat = 8
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        isStroke = true
        guard let touch = touches.first else{
            return
        }
        let currentPoint = touch.location(in: self)
        endPoint = currentPoint
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        let currentPoint = touch.location(in: self)
        let line = Line(sPoint: endPoint, ePoint: currentPoint, color: lineColor)
        lines.append(line)
        endPoint = currentPoint
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isStroke = false
        guard let touch = touches.first else{
            return
        }
        let currentPoint = touch.location(in: self)
        let line = Line(sPoint: endPoint, ePoint: currentPoint, color: lineColor)
        lines.append(line)
        endPoint = nil
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let graphic = UIGraphicsGetCurrentContext()
        
        graphic?.setLineCap(.round)
        for line in lines{
            graphic?.setLineWidth(lineSize)
            graphic?.beginPath()
            graphic?.move(to: line.sPoint)
            graphic?.addLine(to: line.ePoint)
            graphic?.setStrokeColor(line.color)
            graphic?.strokePath()
            setNeedsDisplay()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let doubleTapRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(Drawview.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
            action: #selector(Drawview.longPress(_:)))
        addGestureRecognizer(longPressRecognizer)
        
        let trippleTapRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(Drawview.trippleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 3
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(trippleTapRecognizer)
    }
    
    @objc func doubleTap(_ gestureRecognizer: UIGestureRecognizer) {
        lineSize = 8
        setNeedsDisplay()
    }
    @objc func trippleTap(_ gestureRecognizer: UIGestureRecognizer) {
        lineSize = 16
        setNeedsDisplay()
    }
    
    
    @objc func longPress(_ gestureRecognizer: UIGestureRecognizer) {
        lines = []
        setNeedsDisplay()
        
        
        
    }
}
