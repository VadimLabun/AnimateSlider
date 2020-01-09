//
//  GestureRecognizer.swift
//  AnimateSlider
//
//  Created by Vadim Labun on 12/28/19.
//  Copyright © 2019 Vadim Labun. All rights reserved.
//

import Foundation

import UIKit.UIPanGestureRecognizer

class RotationGestureRecognizer: UIPanGestureRecognizer {
    
   private ( set ) var touchPoint: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
      super.touchesBegan(touches, with: event)
        let touche = touches.first
        let view1 = view
        touchPoint = touche?.location(in: view1)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
      super.touchesMoved(touches, with: event)
        let touche = touches.first
        let view1 = view
        touchPoint = touche?.location(in: view1)
    }
    
    

    override init(target: Any?, action: Selector?) {
      super.init(target: target, action: action)

      maximumNumberOfTouches = 1
      minimumNumberOfTouches = 1
    }
    
    
    
    
}

