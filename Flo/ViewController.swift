//
//  ViewController.swift
//  Flo
//
//  Created by Eric Hodgins on 2016-11-03.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing {
            counterViewTap(gesture: nil)
        }
    }
    
    @IBAction func counterViewTap(gesture: UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            //hide the graph
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        } else {
            // Show graph
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            setupGraphDisplay()
        }
        
        isGraphViewShowing = !isGraphViewShowing
    }
    
    func setupGraphDisplay() {
        // Use 7 days for graph - can use any number,
        // but labels and sample data are set up for 7 days
        
        //let noOfDays: Int = 7
        
        // replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        
        // indicate the the graph needs to be redrawn
        graphView.setNeedsDisplay()
        
        maxLabel.text = "\(graphView.graphPoints.max()!)"
        
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        //set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        // - get today's day number
        
        var weekday = Calendar.current.dateComponents([.weekday], from: Date()).weekday!
        
        let days = ["S", "M", "T", "W", "T", "F", "S"]
        
        // setup the name labels
        for i in stride(from: days.count, to: 0, by: -1) {
            if let labelView = graphView.viewWithTag(i) as? UILabel {

                weekday -= 1
                
                if weekday < 0 {
                    weekday = days.count - 1
                }
                
                labelView.text = days[weekday]
            }
        }
    }
    
}



































