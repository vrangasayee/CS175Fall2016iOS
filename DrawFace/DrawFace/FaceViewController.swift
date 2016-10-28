//
//  ViewController.swift
//  DrawFace
//
//  Created by Narayan Balasubramanian on 10/20/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var redCircle = FaceView()
        view.addSubview(redCircle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

