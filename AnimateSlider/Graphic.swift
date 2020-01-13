//
//  Graphic.swift
//  AnimateSlider
//
//  Created by Vadim Labun on 1/3/20.
//  Copyright © 2020 Vadim Labun. All rights reserved.
//

import Foundation
import UIKit

class Graphic: UIView {
    
    let sharp = CAShapeLayer()
    let percentLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
               
        sharp.path = path.cgPath
        
        sharp.lineWidth = 10
        sharp.strokeColor = UIColor.red.cgColor
        sharp.fillColor = UIColor.blue.cgColor
        sharp.lineCap = .round
        sharp.strokeEnd = 0
        self.layer.addSublayer(sharp)
        
        percentLabel.frame = CGRect(x: 148, y: 230, width: 100, height: 200)
        percentLabel.font = .systemFont(ofSize: 40, weight: .bold)
        percentLabel.text = ""
        addSubview(percentLabel)
    }
    
    func animation(value: CGFloat) {
        let graphicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        graphicAnimation.toValue = value
        graphicAnimation.duration = 2
        graphicAnimation.fillMode = .forwards
        graphicAnimation.isRemovedOnCompletion = false
        
        sharp.add(graphicAnimation, forKey: "basic")
    }

    
}
