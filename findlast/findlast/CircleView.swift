//
//  CircleView.swift
//  findlast
//
//  Created by yong_zhao on 3/5/17.
//  Copyright © 2017 yong_zhao. All rights reserved.
//

import UIKit

class CircleView: UIView{
    //MARK: INIT
    //  override  init(frame: CGRect) {
    //        super.init(frame: frame)
    //    }
    
    init(circle:Circle){
        let frame = CGRect(x: 0, y: 0, width: circle.radius*2, height: circle.radius*2)
        super.init(frame: frame)
        self.backgroundColor = circle.color
        self.center = circle.center
        self.layer.cornerRadius = CGFloat(circle.radius)
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
    
    func hide(){
        self.isHidden=true
    }
    
    
}
