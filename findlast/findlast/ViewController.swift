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
    let  conf = Config()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor=UIColor.blue
        
        
        self.initUI();
//        startButton = UIButton()
//        startButton.setTitle("Play", for: .normal)
//        startButton.bounds=CGRect(x:0,y:0,width:100,height:36)
//        startButton.center=CGPoint(x:view.bounds.width/2,y: view.bounds.height/2);
//        startButton.backgroundColor = UIColor.black
//        
//        view.addSubview(startButton)
        
    }

    func createStartButton(shapeMode:String, colorMode :String){
        //Create start button====================================================
        let startBtn = createButton (shapeMode:shapeMode, colorMode :colorMode,x:Int(view.frame.width/2),y:Int(view.frame.height/2 + 150),title:"Start");
        
        self.view.addSubview(startBtn)
        
        startBtn.addGestureRecognizer(UITapGestureRecognizer(target: startBtn, action: #selector( ShapeView.hide)))

    }
    
    func createSettingButton(shapeMode:String, colorMode :String){
        
        //Create setting button====================================================
        let settingBtn = createButton (shapeMode:shapeMode, colorMode :colorMode,x:Int(view.frame.width/2),y:Int(view.frame.height/2),title:"Setting");
        
        self.view.addSubview(settingBtn)
        
        settingBtn.addGestureRecognizer(UITapGestureRecognizer(target: settingBtn, action: #selector( showSettings)))
        
    }
    
    func createButton(shapeMode:String, colorMode:String, x:Int, y:Int, title:String)->ShapeView{
        
        var button:ShapeView!;
        var width :Int!;
        if(shapeMode == Config.SHAPE_CIRCLE){
            let startBtnCircle = Circle.fixedCircle(x: x, y: y)
            
            button  = CircleView(circle: startBtnCircle)
            width=startBtnCircle.radius;
        }else if (shapeMode == Config.SHAPE_SQUARE){
            let sqaure = Square.fixedSquare(x: x, y: y)
            
            button  = SquareView(square: sqaure)
            width=sqaure.length;

        }
        
        //random color or blackwhite
        
               //startBtn.backgroundColor = UIColor.blue
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        lable.text = title
        lable.textAlignment = NSTextAlignment.center
        lable.center = CGPoint(x: x, y: y )
        
        
        button.addSubview(lable)
        return button
    }
    
   
    
    func initUI(){
        
        createStartButton(shapeMode:conf.shapeMode,colorMode:conf.colorMode)
        createSettingButton(shapeMode:conf.shapeMode,colorMode:conf.colorMode)
        drawBackGround(shapeMode:conf.shapeMode,colorMode:conf.colorMode)
        
    
       
    }
    
    
    func drawBackGround(shapeMode:String, colorMode :String){
        
        //randone cirrle or square
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
        
        
        //Create setting button====================================================
        let shapeBtn = createButton (shapeMode:conf.shapeMode, colorMode :conf.colorMode,x:Int(view.frame.width/2-100),y:Int(view.frame.height/2-200),title:"Shape");
        
        self.view.addSubview(shapeBtn)
        
        shapeBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showShape)))
        
        //show shape button=============================
        
        let colorBtn = createButton (shapeMode:conf.shapeMode, colorMode :conf.colorMode,x:Int(view.frame.width/2+100),y:Int(view.frame.height/2-200),title:"Shape");
        
        self.view.addSubview(colorBtn)
        
        colorBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showColor)))
        
        
    }
    
    func showShape(){
        //show shape button=============================
        let shapeCircle = Circle.fixedCircle(x: Int(view.frame.width/2), y: Int(view.frame.height/2-150))
        
        let shapeBtn  = CircleView(circle: shapeCircle)
        shapeBtn.backgroundColor = UIColor.red
        var settingLable = UILabel(frame: CGRect(x: 0, y: 0, width: shapeCircle.radius, height: shapeCircle.radius))
        settingLable.text = "Circle"
        settingLable.textAlignment = NSTextAlignment.center
        settingLable.center = CGPoint(x: shapeBtn.frame.width/2, y: shapeBtn.frame.height/2 )
        
        
        shapeBtn.addSubview(settingLable)
        self.view.addSubview(shapeBtn)
        
        shapeBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showShape)))
        
        //show shape button=============================
        let colorCircle = Circle.fixedCircle(x: Int((view.frame.width/2)-150), y: Int(view.frame.height/2-150))
        
        let colorBtn  = CircleView(circle: colorCircle)
        colorBtn.backgroundColor = UIColor.red
        settingLable = UILabel(frame: CGRect(x: 0, y: 0, width: colorCircle.radius, height: colorCircle.radius))
        settingLable.text = "Square"
        settingLable.textAlignment = NSTextAlignment.center
        settingLable.center = CGPoint(x: colorBtn.frame.width/2, y: colorBtn.frame.height/2 )
        
        
        colorBtn.addSubview(settingLable)
        self.view.addSubview(colorBtn)
        
        colorBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showColor)))
        
    }

    func showColor(){
        //show shape button=============================
        let shapeCircle = Circle.fixedCircle(x: Int(view.frame.width/2), y: Int(view.frame.height/2-150))
        
        let shapeBtn  = CircleView(circle: shapeCircle)
        shapeBtn.backgroundColor = UIColor.red
        var settingLable = UILabel(frame: CGRect(x: 0, y: 0, width: shapeCircle.radius, height: shapeCircle.radius))
        settingLable.text = "Black&White"
        settingLable.textAlignment = NSTextAlignment.center
        settingLable.center = CGPoint(x: shapeBtn.frame.width/2, y: shapeBtn.frame.height/2 )
        
        
        shapeBtn.addSubview(settingLable)
        self.view.addSubview(shapeBtn)
        
        shapeBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showShape)))
        
        //show shape button=============================
        let colorCircle = Circle.fixedCircle(x: Int((view.frame.width/2)-150), y: Int(view.frame.height/2-150))
        
        let colorBtn  = CircleView(circle: colorCircle)
        colorBtn.backgroundColor = UIColor.red
        settingLable = UILabel(frame: CGRect(x: 0, y: 0, width: colorCircle.radius, height: colorCircle.radius))
        settingLable.text = "Colorful"
        settingLable.textAlignment = NSTextAlignment.center
        settingLable.center = CGPoint(x: colorBtn.frame.width/2, y: colorBtn.frame.height/2 )
        
        
        colorBtn.addSubview(settingLable)
        self.view.addSubview(colorBtn)
        
        colorBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( showColor)))
        
    }

}

