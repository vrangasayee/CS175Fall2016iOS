//
//  FaceExpression.swift
//  DrawFace
//
//  Created by Narayan Balasubramanian on 11/8/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import Foundation

struct FaceExpression {
    enum Eyes: Int {
        case Open
        case Close
        case Squinting
    }
    enum Mouth: Int {
        case Frown
        case Smirk
        case Neutral
        case Smile
        case Grin
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .Frown
        }
        
        func happierMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .Grin
        }
    }
    
    var eyes: Eyes
    var mouth: Mouth
}
