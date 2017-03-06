//
//  ViewController.swift
//  findlast
//
//  Created by yong_zhao on 3/5/17.
//  Copyright © 2017 yong_zhao. All rights reserved.
//

import UIKit

/***
 Settings:
 1) shape: circle, square,variagnle, mixed
 2) color: random, one, black&white
 3) animation
 */
class ViewController1: UIViewController {
    
    var startButton :UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton = UIButton()
        startButton.setTitle("Play", for: .normal)
        startButton.bounds=CGRect(x:0,y:0,width:100,height:36)
        startButton.center=CGPoint(x:view.bounds.width/2,y: view.bounds.height/2);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

