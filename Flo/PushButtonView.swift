//
//  PushButtonView.swift
//  Flo
//
//  Created by Eric Hodgins on 2016-11-03.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

class PushButtonView: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }


}
