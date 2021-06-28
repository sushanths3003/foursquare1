//
//  UIViewController+Extension.swift
//  Foursquare
//
//  Created by Bhoomika H P on 28/06/21.
//

import UIKit

extension UIViewController{
    
    func setGradientConstraints(newLayer : CAGradientLayer){
        newLayer.frame = view.frame
        newLayer.locations = [0, 1]
        newLayer.startPoint = CGPoint(x: 0.5, y: 0)
        newLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(newLayer, at: 0)
        
    }
}
