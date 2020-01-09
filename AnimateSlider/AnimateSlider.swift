//
//  AnimateSlider.swift
//  AnimateSlider
//
//  Created by Vadim Labun on 12/28/19.
//  Copyright © 2019 Vadim Labun. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class AnimateSlider: UIControl {
    
    private  var previousLocation = CGPoint ()
    
    let minLabel = UILabel()
    let maxLabel = UILabel()
    
    var shadowSwitch = true
    
    @IBInspectable let maximumValue: CGFloat = 1.0
    @IBInspectable let minimumValue: CGFloat = 0.0
    var value: CGFloat = 0
    
    let view = UIView()
    let circle = CirkleValue()
    let slider = UIBezierPath()
    
    
    @IBInspectable var color: UIColor = .red
    
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        
        circle.isHidden = true
        let gester = RotationGestureRecognizer(target: self, action: #selector(self.updeinCirclePoint(_:)))
        addGestureRecognizer(gester)
        self.alpha = 1
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        circle.isHidden = true
        let gester = RotationGestureRecognizer(target: self, action: #selector(self.updeinCirclePoint(_:)))
        addGestureRecognizer(gester)
        self.alpha = 1
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        
        circle.frame = CGRect(x: 1, y: 0 , width: 45, height: 45)
        circle.backgroundColor = .clear
        circle.CircleBacgraundColor = color
        addSubview(circle)
        
        view.frame = self.bounds
        view.backgroundColor = color
        view.layer.cornerRadius = rect.height / 2
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        addSubview(view)
        
        layer.cornerRadius = 3
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize.zero
        
        minLabel.frame = CGRect(x: 0, y: 0, width: 50, height: bounds.height)
        minLabel.text = String(format: "%.0f", minimumValue)
        minLabel.textAlignment = .center
        minLabel.font = .systemFont(ofSize: 15, weight: .bold)
        addSubview(minLabel)
        
        maxLabel.frame = CGRect(x: bounds.width - 50, y: 0, width: 50, height: bounds.height)
        maxLabel.text = String(format: "%.0f", maximumValue)
        maxLabel.textAlignment = .center
        maxLabel.font = .systemFont(ofSize: 15, weight: .bold)
        addSubview(maxLabel)
    }
    
    @objc func updeinCirclePoint(_ gesture: RotationGestureRecognizer) {
        
        var location = gesture.location(in: self)
        
        if gesture.state == .changed,
            location.x >= bounds.minX + 15,
            location.x <= bounds.maxX - 15,
            location.y <= bounds.maxY,
            location.y >= bounds.minY{
            
            if location.x < 30 {
                location.x = 1
                let deltaLocation = (location.x + 15) - (previousLocation.x + 15)
                let deltaValue = (maximumValue - minimumValue) * deltaLocation / (bounds.width - 15)
                previousLocation = location
                value += deltaValue
                
            } else {
                let deltaLocation = (location.x) - (previousLocation.x)
                let deltaValue = (maximumValue - minimumValue) * deltaLocation / (bounds.width - 15)
                
                previousLocation = location
                value += deltaValue
            }
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            CATransaction.commit()
            
            UIView.animate(withDuration: 0.4, delay: 0,
                           options: [],
                           animations: {
                            self.circle.frame.origin.y = -45
            })
            
            self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            circle.animate(loc: gesture.location(in: self))
            circle.labelValue.text = String(format: "%.1f", value)
            circle.isHidden = false
        } else {
            UIView.animate(withDuration: 0.5, delay: 0,
                           options: [],
                           animations: {
                            self.circle.frame.origin.y = -8
            })
            
            self.layer.shadowOffset = CGSize.zero
            circle.isHidden = true
        }
        shadowSwitch = !shadowSwitch
        sendActions(for: .valueChanged)
    }
}

