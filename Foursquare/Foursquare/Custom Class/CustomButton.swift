//
//  CustomButton.swift
//  Foursquare
//
//  Created by Sushanth S on 26/06/21.
//

import Foundation
import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        buttonConfiguration()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        buttonConfiguration()
    }
    
    func buttonConfiguration() {
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.tintColor = UIColor.colorForLoginPageButton()
        self.backgroundColor = UIColor.backgroundColorForButton()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.boarderColorForButton().cgColor
        self.clipsToBounds = true
    }
}
