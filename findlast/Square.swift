//
//  Square.swift
//  findlast
//
//  Created by yong_zhao on 3/5/17.
//  Copyright © 2017 yong_zhao. All rights reserved.
//

import UIKit

class Square:Shape {
    
    // MARK: Properties
    static var minLength: Int {
        switch ScreenUtils.screenWidthModel() {
        case .Width320, .Width375, .Width414, .Other:
            return 20
        case .Width768:
            return 40
        case .Width1024:
            return 60
        }
    }
    
    static var maxLength: Int {
        switch ScreenUtils.screenWidthModel() {
        case .Width320, .Width375, .Width414, .Other:
            return 50
        case .Width768:
            return 100
        case .Width1024:
            return 150
        }
    }
    
    var length: Int = 0;
    
    init(color:UIColor, length:Int, center:CGPoint){
        super.init(color: color, center: center)
        self.length = length
        
    }
    
    class func randomSquare() -> Square {
        let screenRect = UIScreen.main.bounds
        let screenWidth:CGFloat = screenRect.width
        let screenHeight:CGFloat = screenRect.height
        let randomLength = minLength + Int(arc4random_uniform(UInt32(maxLength - minLength + 1)))
        
        let areaWidth = Int(screenWidth) - (randomLength << 1);
        let areaHeight = Int(screenHeight) - (randomLength << 1) - 20;
        
        let x = randomLength + Int(arc4random_uniform(100000)) % areaWidth
        let y = 20 + randomLength + Int(arc4random_uniform(100000)) % areaHeight // below the status bar
        let randomPoint = CGPoint(x: x, y: y)
        
        let randomColor = ColorUtilitys.randomColor()
        let square = Square(color: randomColor, length: randomLength, center: randomPoint)
        return square
    }
    
    class func fixedSquare(x:Int,y: Int) -> Square{
        
        let  randomColor =  ColorUtilitys.randomColor()
        
        let center = CGPoint(x: x, y: y)
        let square = Square(color: randomColor, length: maxLength, center: center)
        
        return square
        
    }
}
