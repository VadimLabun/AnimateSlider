//
//  ViewController.swift
//  AnimateSlider
//
//  Created by Vadim Labun on 12/28/19.
//  Copyright © 2019 Vadim Labun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let slider = AnimateSlider()
    
    let graphic = Graphic()
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphic.frame = CGRect(x: 15, y: 100, width: 350, height: 450)
        view.addSubview(graphic)
        self.view.backgroundColor = .green
        slider.color = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        self.view.addSubview(slider)
        slider.frame = CGRect(x: 7, y: 700, width: 400, height: 40)
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        
    }
    
    @objc func sliderAction() {
        
        label.text = String(format: "%.1f", slider.value)
        graphic.procenLabel.text = String(format: "%.f%%", slider.value * 100)
        graphic.sharp.strokeEnd = slider.value - 0.2
    }

}
