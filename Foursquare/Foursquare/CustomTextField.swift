//
//  SearchScreenButtons.swift
//  Foursquare
//
//  Created by Bhoomika H P on 28/06/21.
//

import UIKit
class CustomTextField: UITextField{
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        var newRect = bounds
        
        newRect.origin.x = 50
        newRect.size.width = bounds.size.width - 50
       
       // print(newRect.size.width)
        return newRect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        var newRect = bounds
        
        newRect.origin.x = 50
        newRect.size.width = bounds.size.width - 40
       // print(newRect.size.width)
        return newRect
    }

    
}
