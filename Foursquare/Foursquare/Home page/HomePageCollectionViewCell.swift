//
//  HomePageCollectionViewCell.swift
//  Foursquare
//
//  Created by Sushanth S on 28/06/21.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var options: CustomButtonForCollectionViewOptions!
    //@IBOutlet weak var options: UIButton!
    @IBOutlet weak var buttoname: UILabel!
    
    @IBAction func cellSelected(_ sender: UIButton) {
        if let option = sender as? CustomButtonForCollectionViewOptions {
            //option.backgroundColor = UIColor.colorForNormalLabel()
            option.toggle()
        }
    }
    
}
