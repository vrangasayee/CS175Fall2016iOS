//
//  FaceView.swift
//  DrawFace
//
//  Created by Narayan Balasubramanian on 10/25/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {
    @IBInspectable
    var fillColor: UIColor? { didSet { setNeedsDisplay() }}
    @IBInspectable
    var strokeColor: UIColor?
    @IBInspectable
    var scale : CGFloat = 0.9 { didSet { setNeedsDisplay() }}
    @IBInspectable
    var mouthCurvature : Double = -1.0 { didSet { setNeedsDisplay() }}
    @IBInspectable
    var eyesOpen : Bool = false { didSet { setNeedsDisplay() }}
        
    var radius: CGFloat {
        return min(bounds.width, bounds.height) / 2 * scale
    }
    
    var faceCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    enum Eye {
        case LEFT
        case RIGHT
    }
    
    
    func changeScale(recognizer : UIPinchGestureRecognizer) {
        switch (recognizer.state) {
        //case .Ended: fallthrough
        case .Ended, .Changed:
            scale *= recognizer.scale
            recognizer.scale = 1.0
        default: break
        }
        
    }
    private func getEyeCenter(eye: Eye) -> CGPoint {
        let eyeOffset = radius / 3
        var eyeCenter = faceCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .LEFT: eyeCenter.x -= eyeOffset
        case .RIGHT: eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    
    private func pathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = radius / 10.0
        let eyeCenter = getEyeCenter(eye)
        if (eyesOpen) {
            return pathforCircleCenteredAtPoint(eyeCenter, withRadius: eyeRadius)
        } else {
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLineToPoint(CGPoint(x:eyeCenter.x + eyeRadius, y: eyeCenter.y))
            path.lineWidth = 3.0
            return path
        }
    }
    
    func pathforCircleCenteredAtPoint(midpoint: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.lineWidth = 3.0
        path.addArcWithCenter(midpoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI*2), clockwise: false)
        return path
    }
    
    func pathForMouth() -> UIBezierPath {
        let mouthWidth = radius / 1
        let mouthHeight = radius / 3.0
        let mouthOffset = radius / 3.0
        
        let mouthRect = CGRect(x:faceCenter.x - mouthWidth/2,
            y:faceCenter.y + mouthOffset, width: mouthWidth, height:mouthHeight)
        
        let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
        let start = CGPoint(x:mouthRect.minX, y: mouthRect.minY)
        let end = CGPoint(x:mouthRect.maxX, y: mouthRect.minY)
        let cp1 = CGPoint(x: mouthRect.minX  + mouthRect.width / 3, y: mouthRect.minY + smileOffset)
        let cp2 = CGPoint(x: mouthRect.maxX - mouthRect.width / 3, y: mouthRect.minY + smileOffset)
        
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addCurveToPoint(end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth =  3.0
        return path
    }


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        (fillColor ?? UIColor.greenColor()).setFill()
        (strokeColor ?? UIColor.redColor()).setStroke()
        pathforCircleCenteredAtPoint(faceCenter, withRadius: radius).stroke()
        pathForEye(.LEFT).stroke()
        pathForEye(.RIGHT).stroke()
        pathForMouth().stroke()
        
    }

}
