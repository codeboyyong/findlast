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
class ViewController: UIViewController {
 
    var startButton :UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor=UIColor.blue
        
        
        //self.initUI();
        startButton = UIButton()
        startButton.setTitle("Play", for: .normal)
        startButton.bounds=CGRect(x:0,y:0,width:100,height:36)
        startButton.center=CGPoint(x:view.bounds.width/2,y: view.bounds.height/2);
        startButton.backgroundColor = UIColor.black
        
        view.addSubview(startButton)
        
    }

    
    func initUI(){
        let circle = Circle.fixedCircle(x: Int(view.frame.width/2), y: Int(view.frame.height/2 + 150))
        
        
        let startBtn  = CircleView(circle: circle)
        startBtn.backgroundColor = UIColor.blue
        let retryLable = UILabel(frame: CGRect(x: 0, y: 0, width: circle.radius, height: circle.radius))
        retryLable.text = "Settings"
        retryLable.textAlignment = NSTextAlignment.center
        retryLable.center = CGPoint(x: startBtn.frame.width/2, y: startBtn.frame.height/2 )
        
        
        startBtn.addSubview(retryLable)
        self.view.addSubview(startBtn)
        
        let tap = UITapGestureRecognizer(target: startBtn, action: #selector( CircleView.hide))
        startBtn.addGestureRecognizer(tap)
        
        let circles = Circle.fixedCircle(x: Int(view.frame.width/2), y: Int(view.frame.height/2 ))
        
        let settingBtn  = CircleView(circle: circles)
        settingBtn.backgroundColor = UIColor.red
        let settingLable = UILabel(frame: CGRect(x: 0, y: 0, width: circle.radius, height: circle.radius))
        settingLable.text = "Start"
        settingLable.textAlignment = NSTextAlignment.center
        settingLable.center = CGPoint(x: settingBtn.frame.width/2, y: settingBtn.frame.height/2 )
        
        
        settingBtn.addSubview(settingLable)
        self.view.addSubview(settingBtn)
        
        let settingsTap = UITapGestureRecognizer(target: self, action: #selector( showSettings))
        settingBtn.addGestureRecognizer(settingsTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//
//    func start(_sender:ViewController){
//        _sender.view.subviews[0].isHidden=true
//             //print("start!!!")
//    }
    

    func showSettings(){
        
    }


}

