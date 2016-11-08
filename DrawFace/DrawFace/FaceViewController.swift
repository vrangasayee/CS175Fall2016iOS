//
//  ViewController.swift
//  DrawFace
//
//  Created by Narayan Balasubramanian on 10/20/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    var expression : FaceExpression = FaceExpression(eyes: .Close, mouth: .Smirk) {
        didSet {
            updateUI()
        }
    }
    @IBAction func toggleEyes(sender: UITapGestureRecognizer) {
        switch (expression.eyes) {
        case .Open: expression.eyes = .Close
        case .Close: expression.eyes = .Open
        case .Squinting: break
        }
    }
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "changeScale:"))
            let happierGesture = UISwipeGestureRecognizer(target: self, action: "increaseHappiness:")
            happierGesture.direction = .Down
            faceView.addGestureRecognizer(happierGesture)
            let sadGesture = UISwipeGestureRecognizer(target: self, action: "decreaseHappiness:")
            sadGesture.direction = .Up
            faceView.addGestureRecognizer(sadGesture)
            
            updateUI()
        }
    }
    
    @IBAction func faceViewTap(sender: UITapGestureRecognizer) {
        
        switch(expression.eyes) {
        case .Open: expression.eyes = .Close
        case .Close: expression.eyes = .Open
        default: break
        }
        //updateUI()
    }
   
    func increaseHappiness(recognizer: UISwipeGestureRecognizer) {
        expression.mouth = expression.mouth.happierMouth()
    }
    func decreaseHappiness(recognizer: UISwipeGestureRecognizer) {
        expression.mouth = expression.mouth.sadderMouth()
    }

    func updateUI() {
        switch(expression.eyes) {
        case .Open: faceView.eyesOpen = true
        case .Close: faceView.eyesOpen = false
        case .Squinting: faceView.eyesOpen = false
        }
        faceView.mouthCurvature = -1 + Double(expression.mouth.rawValue) * 0.5
        
    }

}

