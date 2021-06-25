//
//  CustomBackgroundForView.swift
//  Foursquare
//
//  Created by Sushanth S on 25/06/21.
//

import Foundation
import UIKit

class CustomBackgroundForView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setBackgroundforView()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setBackgroundforView()
    }
    
    func setBackgroundforView() {
        
        self.layer.contents = #imageLiteral(resourceName: "backgroundImage").cgImage
    }
}
