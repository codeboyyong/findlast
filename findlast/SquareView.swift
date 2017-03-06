//
//  SquareView.swift
//  findlast
//
//  Created by yong_zhao on 3/5/17.
//  Copyright © 2017 yong_zhao. All rights reserved.
//

import UIKit

class SquareView: UIView{
    
    
    init(square:Square){
        let frame = CGRect(x: 0, y: 0, width: square.length, height: square.length)
        super.init(frame: frame)
        self.backgroundColor = square.color
        self.center = square.center
        self.layer.cornerRadius = CGFloat(5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func blink(completion:@escaping ()->Void){
        
        let scaleUpAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleUpAnim.toValue = 1.5
        scaleUpAnim.repeatCount = 3
        scaleUpAnim.duration = 0.2
        scaleUpAnim.autoreverses    = true
        CATransaction.begin()
        CATransaction .setCompletionBlock(completion)
        self.layer.add(scaleUpAnim, forKey: nil)
        CATransaction.commit()
        
    }
    
    
}
