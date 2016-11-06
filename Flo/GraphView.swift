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
    
    //Weekly sample data
    var graphPoints: [Int] = [4, 2, 6, 4, 5, 8, 3]

    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        // set up the background clipping area
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        
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
        
        // Calculate the x point
        
        let margin: CGFloat = 20.0
        let columnXPoint = { (column: Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) / CGFloat((self.graphPoints.count - 1))
            var x: CGFloat = CGFloat(column) * spacer
            x += margin + 2
            
            return x
        }
        
        // Calculate the y point
        let topBorder: CGFloat = 60
        let bottomBorder: CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.max()!
        let columnYPoint = { (graphPoint: Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            
            return y
        }
        
        // Draw the line graph
        UIColor.white.setFill()
        UIColor.white.setStroke()
        
        // Set the points line
        let graphPath = UIBezierPath()
        // go to start fo line
        graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
        
        // add points for each item in the graphPoints array at the correct (x, y) for the point
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }
        
        graphPath.stroke()
        
        // Create the clipping path for the graph gradient
        // 1 save the state of the context
        //context!.saveGState()
        
        // make a copy of the path 
        let clippingPath  = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLine(to: CGPoint(x: columnXPoint(graphPoints.count - 1), y: height))
        clippingPath.addLine(to: CGPoint(x: columnXPoint(0), y: height))
        clippingPath.close()
        
        // add the clipping path to the context
        clippingPath.addClip()
        
        // check the clipping path - temp code
        UIColor.green.setFill()
        let rectPath = UIBezierPath(rect: self.bounds)
        rectPath.fill()
    }
    

}































