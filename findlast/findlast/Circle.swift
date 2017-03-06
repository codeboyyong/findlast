//
//  Circle.swift
//  findlast
//
//  Created by yong_zhao on 3/5/17.
//  Copyright © 2017 yong_zhao. All rights reserved.
//

import UIKit

class Circle:Shape {
    
    // MARK: Properties
    static var minRadius: Int {
        switch ScreenUtils.screenWidthModel() {
        case .Width320, .Width375, .Width414, .Other:
            return 20
        case .Width768:
            return 40
        case .Width1024:
            return 60
        }
    }
    static var maxRadius: Int {
        switch ScreenUtils.screenWidthModel() {
        case .Width320, .Width375, .Width414, .Other:
            return 50
        case .Width768:
            return 100
        case .Width1024:
            return 150
        }
    }
    
    var radius: Int = 0;
    
    init(color:UIColor, radius:Int, center:CGPoint){
        super.init(color: color, center: center)
        self.radius = radius

    }
    
    class func randomCircle() -> Circle {
        let screenRect = UIScreen.main.bounds
        let screenWidth:CGFloat = screenRect.width
        let screenHeight:CGFloat = screenRect.height
        let randomRadius = minRadius + Int(arc4random_uniform(UInt32(maxRadius - minRadius + 1)))
        
        let areaWidth = Int(screenWidth) - (randomRadius << 1);
        let areaHeight = Int(screenHeight) - (randomRadius << 1) - 20;
        
        let x = randomRadius + Int(arc4random_uniform(100000)) % areaWidth
        let y = 20 + randomRadius + Int(arc4random_uniform(100000)) % areaHeight // below the status bar
        let randomPoint = CGPoint(x: x, y: y)
        
        let randomColor = ColorUtilitys.randomColor()
        let circle = Circle(color: randomColor, radius: randomRadius, center: randomPoint)
        return circle
    }
    
    class func fixedCircle(x:Int,y: Int) -> Circle{
        
        let  randomColor =  ColorUtilitys.randomColor()
        
        let center = CGPoint(x: x, y: y)
        let circle = Circle(color: randomColor, radius: maxRadius, center: center)
        
        return circle
        
    }
}
