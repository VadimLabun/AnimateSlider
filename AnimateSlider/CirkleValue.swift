//
//  CirkleValue.swift
//  AnimateSlider
//
//  Created by Vadim Labun on 12/28/19.
//  Copyright © 2019 Vadim Labun. All rights reserved.
//

import Foundation
import UIKit


class CirkleValue: UIView {
    
    let labelValue = UILabel()
    
    var CircleBacgraundColor: UIColor = .red
    
    override func draw(_ rect: CGRect) {
        let valueCircle = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 30, height: 30))
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 20, y: 39 ))
        path.addLine(to: CGPoint(x: 30, y: 40))
        path.addLine(to: CGPoint(x: 25, y: 45))
        path.addLine(to: CGPoint(x: 20, y: 40))
        
        path.lineWidth = 2
        UIColor.black.setStroke()
        path.fill()
        path.stroke()
        
        labelValue.frame = valueCircle.bounds
        labelValue.text = ""
        labelValue.textAlignment = .center
        labelValue.font = .systemFont(ofSize: 13, weight: .bold)
        addSubview(labelValue)
        
        valueCircle.lineWidth = 2
        UIColor.black.setStroke()
        CircleBacgraundColor.setFill()
        valueCircle.fill()
        valueCircle.stroke()
        
        
    }
    
    
    func animate(loc: CGPoint) {
    
        let hover = CABasicAnimation(keyPath: "position")

        hover.isAdditive = true
        hover.fromValue = CGPoint(x: loc.x - 27, y: 0)
        hover.toValue = CGPoint(x: loc.x - 27, y: 0)
        hover.autoreverses = true
        hover.duration = 1
        hover.repeatCount = Float.infinity

        layer.add(hover, forKey: "myHoverAnimation")
    }
    
}
