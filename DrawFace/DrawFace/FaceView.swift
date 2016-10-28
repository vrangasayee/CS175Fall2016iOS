//
//  FaceView.swift
//  DrawFace
//
//  Created by Narayan Balasubramanian on 10/25/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class FaceView: UIView {
    var fillColor: UIColor?
    var strokeColor: UIColor?


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let radius = min(bounds.width, bounds.height)/2
        let pivot = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath()
        path.addArcWithCenter(pivot, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI*2), clockwise: false)
        
        (fillColor ?? UIColor.greenColor()).setStroke()
        (strokeColor) ?? UIColor.re
        path.lineWidth = 3.0
        path.stroke()
    }


}
