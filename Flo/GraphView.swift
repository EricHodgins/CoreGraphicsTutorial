//
//  GraphView.swift
//  Flo
//
//  Created by Eric Hodgins on 2016-11-05.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

@IBDesignable

class GraphView: UIView {
    
    // Gradients properties
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green

    override func draw(_ rect: CGRect) {
        // get the context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor] as CFArray
        
        // setup up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // setup the color stops
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        // create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: colorLocations)
        
        // draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: self.bounds.height)
        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }
    

}
