//
//  HomePageViewController.swift
//  Foursquare
//
//  Created by Sushanth S on 28/06/21.
//

import UIKit
import MapKit

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var containerViewforPopular: UIView!
    @IBOutlet weak var collectionViewForHome: UICollectionView!
    @IBOutlet weak var nearYouContainerView: UIView!
    
    let values: [String] = CollectionViewOptions.allCases.map { $0.rawValue }
    var selectedCellIndexPath = [IndexPath] ()
    var selectindexpath: IndexPath = [0, 0]
    var signInVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NearYouViewController") as! NearYouViewController
    var signUpVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopularViewController")  as! PopularViewController
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewForHome.delegate = self
        self.collectionViewForHome.dataSource = self
        collectionViewForHome.autoresizesSubviews = false
        add(asChildViewController: signInVc, index: 0)
       
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionViewForHome.collectionViewLayout as? UICollectionViewFlowLayout else {
            
            return
        }
        let height = view.frame.size.height
        let width = view.frame.size.width
        flowLayout.invalidateLayout()
        collectionViewForHome.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomePageCollectionViewCell {
            
            cell.buttoname.text = "\(values[indexPath.row])"
          
            return cell
        }
        
        return HomePageCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = view.frame.size.height
        let width = view.frame.size.width
 
        return CGSize(width: view.frame.width / 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell did selected \(indexPath)")
        if indexPath == selectindexpath {
            add(asChildViewController: signInVc, index: 0)
        } else {
            add(asChildViewController: signUpVc, index: 1)
        }
        let cell = collectionView.cellForItem(at: indexPath) as! HomePageCollectionViewCell
            cell.buttoname.textColor = UIColor.colorForHighlightedLabel()
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HomePageCollectionViewCell
            cell.buttoname.textColor = UIColor.colorForNormalLabel()
//        collectionView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UICollectionView.RowAnimation.None)
        collectionView.reloadItems(at: [indexPath])
        
        
        
    }

  
    @IBAction func optionSeleted(_ sender: CustomButtonForCollectionViewOptions) {
        
    }
    
    
    func add(asChildViewController viewController: UIViewController, index: Int) {
        
        if index == 0 {
            
            containerViewforPopular.alpha = 0
            nearYouContainerView.alpha = 1
            addChild(viewController)
            nearYouContainerView.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            viewController.view.frame = nearYouContainerView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
        } else {
            
            nearYouContainerView.alpha = 0
            containerViewforPopular.alpha = 1
            addChild(viewController)
            containerViewforPopular.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            viewController.view.frame = containerViewforPopular.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
        }
    }
    
     func remove(asChildViewController viewController: UIViewController) {
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
}

extension HomePageViewController {
//    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width / 5, height: 60)
//    }
    
}

