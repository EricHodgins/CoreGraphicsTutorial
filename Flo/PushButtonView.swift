//
//  PushButtonView.swift
//  Flo
//
//  Created by Eric Hodgins on 2016-11-03.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

@IBDesignable

class PushButtonView: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setFill()
        path.fill()
        
        // Widht and Height vars for horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // create the path
        let plusPath = UIBezierPath()
        
        // set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        // move initial point of the path to the start of the horizontal stroke
        plusPath.move(to: CGPoint(x: bounds.width / 2 - plusWidth / 2, y: bounds.height / 2))
        
        // add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2))
        
        // set the stroke color
        UIColor.white.setStroke()
        
        // draw the stroke
        plusPath.stroke()
    }


}
