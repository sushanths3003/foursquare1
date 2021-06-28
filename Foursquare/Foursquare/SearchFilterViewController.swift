//
//  SearchFilterViewController.swift
//  Foursquare
//
//  Created by Bhoomika H P on 28/06/21.
//

import UIKit

class SearchFilterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentview: UIView!
    let newLayer = CAGradientLayer()
    var heightNotSet = true
    var screenHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 135
        self.setGradientConstraints(newLayer : newLayer)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
      //  super.viewDidLayoutSubviews()
        newLayer.frame = view.bounds
          if UIDevice.current.orientation.isLandscape && heightNotSet {
               screenHeight = scrollView.frame.size.width
               heightNotSet = false
              
           } else if heightNotSet {
               screenHeight = scrollView.frame.size.height
            print( screenHeight)
               heightNotSet = false
           }
       
    let heightConstraint = NSLayoutConstraint(item: contentview ?? "nil"  , attribute: NSLayoutConstraint.Attribute
           .height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenHeight)
        
           contentview.addConstraint(heightConstraint)
       
       }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
