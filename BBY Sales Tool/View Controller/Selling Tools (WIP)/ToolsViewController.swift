//
//  ToolsCollectionViewController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/18/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//
// https://github.com/yacir/CollectionViewSlantedLayout

import CollectionViewSlantedLayout
import UIKit

class ToolsViewController: UIViewController, CollectionViewDelegateSlantedLayout {

    @IBOutlet weak var slantedCollectionView: UICollectionView!
    @IBOutlet var slantedLayout: CollectionViewSlantedLayout!
    
    
    // MARK: - Properties
    
    private let segueIdentifier = "toDetailVC"
    private var sellingTools: [SellingTool] {
           return SellingToolController.shared.sellingTools
    }
    override var prefersStatusBarHidden : Bool {
        return true
    }
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    
    // MARK: - Life-Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        slantedCollectionView.dataSource = self
        slantedCollectionView.delegate = self
        print(sellingTools)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.slantedCollectionView.reloadData()
        self.slantedCollectionView.collectionViewLayout.invalidateLayout()
    }

    
    // MARK: - Segue
    
    // TODO: - Finish this function to pass information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let sellingToolDetailVC = segue.destination as? SellingToolDetailViewController else {
                UIAlertController.shared.presentAlertControllerForError(on: self, title: "Why this no work", msg: "This do nothin'")
                return
            }
            // pass info to follow VC
        }
    }

    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = self.slantedCollectionView else {return}
        guard let visibleCells = collectionView.visibleCells as? [SellingToolsCustomCollectionCell] else {return}
        for parallaxCell in visibleCells {
            let yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.imageHeight) * yOffsetSpeed
            let xOffset = ((collectionView.contentOffset.x - parallaxCell.frame.origin.x) / parallaxCell.imageWidth) * xOffsetSpeed
            parallaxCell.offset(CGPoint(x: xOffset,y :yOffset))
        }
    }
    
    // MARK: UICollectionViewDelegate

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("Did select item at indexPath: [\(indexPath.section)][\(indexPath.row)]")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: CollectionViewSlantedLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGFloat {
        return collectionViewLayout.scrollDirection == .vertical ? 275 : 325
    }
    

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }

}


// MARK: UICollectionViewDataSource

extension ToolsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sellingTools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SellingToolsCustomCollectionCell.name, for: indexPath) as? SellingToolsCustomCollectionCell else {
            UIAlertController.shared.presentAlertControllerForError(on: self, title: "So much error found", msg: "Come back later")
            return UICollectionViewCell()
        }
        
        if let cellImage = sellingTools[indexPath.row].cellImage {
            cell.image = cellImage
        }
        
        if let layout = slantedCollectionView.collectionViewLayout as? CollectionViewSlantedLayout {
            cell.contentView.transform = CGAffineTransform(rotationAngle: layout.slantingAngle)
        }
        return cell
    }
    
}
